
# Local Fork

This is a development fork investigating getting everything to build under the open source FPGA toolchain.

It is a work in progress.  Things are starting to build, but have not been tested and timing looks like it's not quite there yet.

1. Install yosys, icestorm, nextpnr-icestorm, and verilator
2. run `make vera-module` in the fpga directory

### Supported Targets

- vera-module -- the original VERA module
- vera-turaco -- VERA configured for use in Turaco
- vera-icebreaker -- VERA for IceBreaker Board (3bpp HDMI on PMOD2, SPI interface enabled)
- vera-icebreaker-12bpp -- VERA for IceBreaker Board (12bpp HDMI on PMOD1A/B, SPI interface enabled)
- vera-icebreaker-pico -- VERA for IceBreaker Board (3bpp HDMI on PMOD2, bus on PMOD1A/B)

# VERA module - Video Embedded Retro Adapter
This repository contains the files related to the VERA module. This module is developed for the Commander X16 computer by The 8-Bit Guy.

**NOTE**: The Commander X16 logo is part of the Commander X16 project and should not be used when the module is used with other projects.
