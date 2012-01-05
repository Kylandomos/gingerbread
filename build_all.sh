rm initramfs.cpio
cd initramfs
find . -print0 | cpio --null -ov --format=newc > ../initramfs.cpio
cd ../Kernel
make clean
make menuconfig
make -j8
cd modules/vibetonz
make KDIR=../../
cd ../fm_si4709
make KDIR=../../
cd ../bcm4329
make KDIR=../../
cd ../param
make KDIR=../../
cd ../../../
pwd
echo "copy modules"
cd Kernel
find . -name *.ko | while read MODULE; do cp $MODULE ../initramfs/lib/modules/ ; done
cd ..
pwd
echo "regenere initram"
rm initramfs.cpio
cd initramfs
find . -print0 | cpio --null -ov --format=newc > ../initramfs.cpio
cd ../Kernel
make -j8
cd modules/vibetonz
make KDIR=../../
cd ../fm_si4709
make KDIR=../../
cd ../bcm4329
make KDIR=../../
cd ../param
make KDIR=../../
cd ../../../
cp Kernel/arch/arm/boot/zImage .
tar -cf zImage.tar zImage
echo Ready
