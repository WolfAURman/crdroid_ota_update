#!/bin/bash
#put script in crDroid source folder, make executable (chmod +x createupdate.sh) and run it (./createupdate.sh)

#modify values below
#leave blank if not used
maintainer="Krell RHEL (WolfAURman)" #ex: Lup Gabriel (gwolfu)
oem="Xiaomi" #ex: OnePlus
device="lava" #ex: guacamole
devicename="Redmi 9" #ex: OnePlus 7 Pro
##
script_path="~/android/crdroid9"
zip=$(basename out/target/product/lava/crDroidAndroid-13.0-*-lava-*.zip)
nozip=$(basename out/target/product/lava/crDroidAndroid-13.0-*-lava-*.zip .zip)
time=$(cat out/build_date.txt)
date=$(echo $zip | cut -f3 -d '-')
ver=$(echo $zip | cut -b 36-38)
##
buildtype="Monthly" #choose from Testing/Alpha/Beta/Weekly/Monthly
forum="https://t.me/WolfAURman_Discussion" #https link (mandatory)
gapps="https://sourceforge.net/projects/nikgapps/files/Releases/NikGapps-T/08-Sep-2022/NikGapps-core-arm64-13-20220908-signed.zip/download" #https link (leave empty if unused)
firmware="" #https link (leave empty if unused)
modem="" #https link (leave empty if unused)
bootloader="" #https link (leave empty if unused)
recovery="" #https link (leave empty if unused)
paypal="" #https link (leave empty if unused)
telegram="https://t.me/red_hat_interprise13" #https link (leave empty if unused)
dt="https://github.com/Redmi-MT6768/android_device_xiaomi_lava" #https://github.com/crdroidandroid/android_device_<oem>_<device_codename>
commondt="https://github.com/Redmi-MT6768/android_device_xiaomi_mt6768-common" #https://github.com/crdroidandroid/android_device_<orm>_<SOC>-common
kernel="https://github.com/Redmi-MT6768/android_kernel_xiaomi_mt6768" #https://github.com/crdroidandroid/android_kernel_<oem>_<SOC>


#don't modify from here
zip_name=$script_path/out/target/product/$device/$zip
buildprop=$script_path/out/target/product/$device/system/build.prop

#if [ -f $script_path/$device.json ]; then
#  rm $script_path/$device.json
#fi

linenr=`grep -n "ro.system.build.date.utc" $buildprop | cut -d':' -f1`
timestamp=`sed -n $linenr'p' < $buildprop | cut -d'=' -f2`
zip_only=`basename "$zip_name"`
md5=`md5sum "$zip_name" | cut -d' ' -f1`
sha256=`sha256sum "$zip_name" | cut -d' ' -f1`
size=`stat -c "%s" "$zip_name"`
version=`echo "$zip_only" | cut -d'-' -f5`
v_max=`echo "$version" | cut -d'.' -f1 | cut -d'v' -f2`
v_min=`echo "$version" | cut -d'.' -f2`
version=`echo $v_max.$v_min`

echo '{
  "response": [
    {
        "maintainer": "'$maintainer'",
        "oem": "'$oem'",
        "device": "'$devicename'",
        "filename": "'$zip_only'",
        "download": "https://github.com/WolfAURman/crdroid_ota_update/releases/download/'$nozip'/'$zip'",
        "timestamp": '$timestamp',
        "md5": "'$md5'",
        "sha256": "'$sha256'",
        "size": '$size',
        "version": "'$version'",
        "buildtype": "'$buildtype'",
        "forum": "'$forum'",
        "gapps": "'$gapps'",
        "firmware": "'$firmware'",
        "modem": "'$modem'",
        "bootloader": "'$bootloader'",
        "recovery": "'$recovery'",
        "paypal": "'$paypal'",
        "telegram": "'$telegram'",
        "dt": "'$dt'",
        "common-dt": "'$commondt'",
        "kernel": "'$kernel'"
    }
  ]
}' > ~/crdroid_ota_update/9.x/$device.json

##

git add -A && git commit -m "The configuration has been updated due to version $ver"

git push

gh release create $nozip --notes "Automated release CrDroid for $device $ver $date/$time" $script_path/out/target/product/$device/$zip