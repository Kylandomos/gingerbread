rm initramfs.cpio
cd initramfs
echo "strip modules"
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/cifs.ko
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/dhd.ko
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/fsr.ko
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/fsr_stl.ko
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/lockd.ko
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/nfs.ko
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/nfs_acl.ko
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/param.ko
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/ramzswap.ko
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/scsi_wait_scan.ko
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/Si4709_driver.ko
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/storage.ko
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/sunrpc.ko
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/svnet.ko
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/tun.ko
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/vibrator.ko
/opt/toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/xt_TCPMSS.ko
find . -print0 | cpio --null -ov --format=newc > ../initramfs.cpio
cd ../Kernel
make menuconfig
export KBUILD_BUILD_VERSION="cm7_kernel_std_1.2"
make -j8
echo Ready
