# MyPYNQ

This Git repository contains the board files and related scripts used for compiling the [PYNQ](https://github.com/Xilinx/PYNQ.git) image.

## Repository Structure

- **boards/**: Directory containing the board files.
- **scripts/**: Directory containing the scripts used for compilation.


## Requirements

- PYNQ version >= 3.0.1
- Vivado version 2022.1
- Petalinux 2022.1

## Configuration File

The `boards\<board_name>\petalinux_bsp\meta-user\conf\petalinuxbsp.conf` file describes the path for `aarch64 sstate_cache` or `arm sstate_cache`.

The `boards\aisl\petalinux_bsp\meta-user\recipes-bsp\device-tree\files\system-user.dtsi` file describes the SD card device tree related content. If in the Zynq design, `sd0` is set as eMMC and `sd1` is set as SD card, you may need to configure the device tree `sdhci1` and ensure to use the `scripts\switch_mmcblk_to.sh` script to set `/dev/mmcblk1p2` as the boot disk.