rm initramfs.cpio
cd initramfs
echo "strip modules"
../../../toolchains/arm-2011.03/bin/arm-none-eabi-strip -g lib/modules/*.ko
find . -print0 | cpio --null -ov --format=newc > ../initramfs.cpio
cd ../Kernel
make menuconfig
export KBUILD_BUILD_VERSION="cm7_kernel_oc_1.3"
make -j8
echo Ready
