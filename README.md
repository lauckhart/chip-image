# chip-image

Docker images for [connectedhomeip](https://github.com/project-chip/connectedhomeip) certification testing.

This is the source for **ghcr.io/lauckhart/chip-image** published here: https://github.com/lauckhart/chip-image

These images have a custom build pipeline optimized for quick build and minimal image size.  The core chip-image
container provides everything needed to run tests.  The image is self-describing with a metadata bundle in
`/lib/test-descriptor.json` that documents the tests available in machine readable format.

Note that this repo isn't affiliated with the Connectivity Standards Alliance.  The images and tooling are useful during
development of Matter devices but don't involve actual certification.  Matter is a trademark of the Connectivity
Standards Alliance.

## Usage

The [bin](./bin) directory contains additional helper scripts you can use on the host:

* [build](./bin/build) builds the image
* [rebuild](./bin/rebuild) builds the image from scratch
* [shell](./bin/shell) starts an interactive bash shell inside a local container
* [tool](./bin/tool) runs chip-tool inside a local container
* [publish](./bin/publish) pushes the image to GHCR with "latest" tag
* [pull](./bin/pull) pulls the image from GHCR

Due to Docker limitations, the container currently requires host networking for reliable MDNS communication if your
device or controller runs outside of Docker.  We provide dbus/avahi in chip-image so it's easy to start a dedicated
instance.

## Building

The [Dockerfile](./Dockerfile) implements a multistage buildx that produces a relatively lightweight final image with
chip-tool and [connectedhomeip](https://github.com/project-chip/connectedhomeip) certification tests.

Run [build](./bin/build) to build.

See [publish](./bin/publish) for details on how to push updated images.

We currently build for **linux/amd64** and use emulation on Arm Macs.  x86 is appropriate for GitHub CI. Building for
Arm under emulation is way to slow and running under emulation on MacOS works fine.

Cross-compilation is theoretically possible with chip tooling.  Patient volunteers with buildx, gn and ninja experience
welcome. 😉
