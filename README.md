OpTiMSoC Buildroot-Based Linux Image Creator
============================================

This repository contains all necessary tooling to create a full Linux-based operating system image for [OpTiMSoC](https://www.optimsoc.org).
The image is created using [Buildroot](https://buildroot.org/).

How to use this repository
--------------------------
In Buildroot-speak, this repository is a [br2-external tree](https://buildroot.org/downloads/manual/manual.html#outside-br-custom).
In addition to this repository you need a [supported buildroot version](/buildroot_version), either from a git clone or a released version.

To build a Linux image invoke `make` from the buildroot source tree, and pass the `BR2_EXTERNAL` variable to it with a path to this directory.
You can then use buildroot as usual, e.g. `make BR2_EXTERNAL=path/to/this/dir menuconfig`.
See the [buildroot documentation](https://buildroot.org/downloads/manual/manual.html) for details how to use buildroot.

Example: to build the `optimsoc_computetile_singlecore` Linux image run the following commands.

```sh
OPTIMSOC_BUILDROOT_DIR=path/to/this/directory

# get buildroot (if you don't have it yet)
OPTIMSOC_BUILDROOT_VERSION=$(cat $OPTIMSOC_BUILDROOT_DIR/buildroot_version)
git clone --depth=1 --branch $OPTIMSOC_BUILDROOT_VERSION git://git.busybox.net/buildroot
cd buildroot

# select the default configuration for this board
make BR2_EXTERNAL=$OPTIMSOC_BUILDROOT_DIR optimsoc_computetile_singlecore_defconfig
# optional: configure the image further (i.e. add additional software)
make menuconfig

# finally, build the image
make
```

You can then find the resulting Linux boot image at `output/images/vmlinux`.
It's a regular ELF file which contains both the Linux kernel and an "initial ramdisk," i.e. a full filesystem image with all userspace code.

Supported "boards"
------------------
For some of our OpTiMSoC example designs this repository contains a full set of configuration files which enable you to only execute a couple commands to get a Linux image from scratch.
Use these files

- `optimsoc_computetile_singlecore`: An image for the `compute_tile` example designs of OpTiMSoC configured with `NUM_CORES=1`. Linux is configured without SMP support, and no NoC driver is present.
