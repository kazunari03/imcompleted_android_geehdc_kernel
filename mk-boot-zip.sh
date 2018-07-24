
SRC=geehdc
ZIPNAME=RR-M-boot-`date +'%Y%m%d-%H%M'`-$SRC.zip

rm -f ./boot/boot.img-kernel 
rm -f boot.img

cp -v $SRC/arch/arm/boot/zImage  ./boot/boot.img-kernel

cd boot

../tools/repack_ramdisk ./ramdisk boot.img-ramdisk.cpio.gz

../tools/mkbootimg \
 --kernel ./boot.img-kernel \
 --ramdisk ./boot.img-ramdisk.cpio.gz \
 --cmdline 'console=ttyHSL0,115200,n8 androidboot.hardware=geehrc lpj=67677 user_debug=31 androidboot.selinux=permissive' \
 --base            0x80200000 \
 --ramdisk_offset  0x02000000 \
 --pagesize 2048 \
 -o ../boot.img

cd ..

zip -r ../$ZIPNAME META-INF boot.img system 

echo $ZIPNAME " created done"

