#!/bin/bash

# Don't forget to use ```export crpath="path_to_your_crdroid_directory"```

maintainer="Krell RHEL (WolfAURman)"                                                          # Here we get the name of maintainer
device=$(ls $crpath/out/target/product)                                                       # Here we get the name of the device based on the name of the folder
time=$(cat $crpath/out/build_date.txt)                                                        # Here we get the build time
zip=$(basename $crpath/out/target/product/$device/crDroidAndroid-13.0-*-$device-*.zip)        # Here we get the package name with the extension .zip
nozip=$(basename $crpath/out/target/product/$device/crDroidAndroid-13.0-*-$device-*.zip .zip) # Here we get the package name without the extension .zip
date=$(echo $zip | cut -f3 -d '-')                                                            # Here we get the build date (in YYYY-MM-DD format)

  case "${device,,}" in 

	"lava"         ) devicename="Redmi 9" && oem="Xiaomi"       ;;  #
	"daisy"        ) devicename="Mi A2 Lite" && oem="Xiaomi"    ;;  # This is where the necessary information is assigned to the desired variable
	"jason"        ) devicename="Mi Note 3" && oem="Xiaomi"     ;;  # This allows you not to change the script for each device separately
	"onclite"      ) devicename="Redmi 7" && oem="Xiaomi"       ;;  #
	"sakura"       ) devicename="Redmi 6 Pro" && oem="Xiaomi"   ;;  #
    "poplar_dsds"  ) devicename="Xperia XZ1 Dual" && oem="Sony" ;;  #

	esac

buildtype="Monthly"                          # choose from Testing/Alpha/Beta/Weekly/Monthly
forum="https://t.me/WolfAURman_Discussion"   # https link (mandatory)
gapps="https://sourceforge.net/projects/nikgapps/files/Releases/Android-13/31-Dec-2024/NikGapps-core-arm64-13-20241231-signed.zip/download" #https link (leave empty if unused)
firmware=""                                  # https link (leave empty if unused)
modem=""                                     # https link (leave empty if unused)
bootloader=""                                # https link (leave empty if unused)
recovery=""                                  # https link (leave empty if unused)
paypal=""                                    # https link (leave empty if unused)
telegram="https://t.me/red_hat_interprise13" # https link (leave empty if unused)
dt=""                                        # https://github.com/crdroidandroid/android_device_<oem>_<device_codename>
commondt=""                                  # https://github.com/crdroidandroid/android_device_<orm>_<SOC>-common
kernel=""                                    # https://github.com/crdroidandroid/android_kernel_<oem>_<SOC>

#don't modify from here
zip_name=$crpath/out/target/product/$device/$zip
buildprop=$crpath/out/target/product/$device/system/build.prop

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
}' > 9.x/$device.json

git add -A && git commit -m "Update autogenerated json for $device $version $date/$time" && git push
gh release create $nozip --notes "Automated release CrDroid for $device $version $date/$time" $crpath/out/target/product/$device/$zip
