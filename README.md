#RessurentionRemix 5.7.4 ROM boot.img for L01E/LGL21(geehdc) 

how to get gcc
$ git clone -b marshmallow-release https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8

edit set-env.sh gcc path 

how to build 
$ source set-env.sh
$ cd geehdc
$ make geehdc_defconfig
$ make -j4
$ cd ..
$ sh mk-boot-zip.sh

this boot.img device id is geehrc.(not geehdc)
  


