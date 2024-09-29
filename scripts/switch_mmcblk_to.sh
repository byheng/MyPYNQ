#!/bin/bash

# 检查是否传递了参数
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [0 | 1]"
    echo "0: Replace mmcblk1p2 with mmcblk0p2"
    echo "1: Replace mmcblk0p2 with mmcblk1p2"
    exit 1
fi

# 修改的文件路径
makefile="sdbuild/Makefile"
dtsi_file="sdbuild/boot/meta-pynq/recipes-bsp/device-tree/files/pynq_bootargs.dtsi"

# 根据参数选择替换方向
if [ "$1" -eq 1 ]; then
    # 替换 mmcblk0p2 为 mmcblk1p2
    if grep -q "mmcblk0p2" "$dtsi_file"; then
        sed -i 's/mmcblk0p2/mmcblk1p2/g' "$dtsi_file"
        echo "Replaced mmcblk0p2 with mmcblk1p2 in $dtsi_file."
    else
        echo "No occurrence of mmcblk0p2 found in $dtsi_file."
    fi

    if grep -q "mmcblk0p2" "$makefile"; then
        sed -i 's/mmcblk0p2/mmcblk1p2/g' "$makefile"
        echo "Replaced mmcblk0p2 with mmcblk1p2 in $makefile."
    else
        echo "No occurrence of mmcblk0p2 found in $makefile."
    fi
elif [ "$1" -eq 0 ]; then
    # 替换 mmcblk1p2 为 mmcblk0p2
    if grep -q "mmcblk1p2" "$dtsi_file"; then
        sed -i 's/mmcblk1p2/mmcblk0p2/g' "$dtsi_file"
        echo "Replaced mmcblk1p2 with mmcblk0p2 in $dtsi_file."
    else
        echo "No occurrence of mmcblk1p2 found in $dtsi_file."
    fi

    if grep -q "mmcblk1p2" "$makefile"; then
        sed -i 's/mmcblk1p2/mmcblk0p2/g' "$makefile"
        echo "Replaced mmcblk1p2 with mmcblk0p2 in $makefile."
    else
        echo "No occurrence of mmcblk1p2 found in $makefile."
    fi
else
    # 如果参数不正确，给出提示并退出
    echo "Invalid argument: $1"
    echo "Usage: $0 [0 | 1]"
    exit 1
fi
