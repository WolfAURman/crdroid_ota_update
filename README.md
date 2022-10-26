# Unoffcial CrDroid OTA update #

> Fork from [CrDroid](https://github.com/crdroidandroid/android_vendor_crDroidOTA)

![crDroid-Custom-ROM-Logo](https://user-images.githubusercontent.com/93985232/170225142-a35db9ff-1427-4256-859c-14b255502c50.png)

> You can find all updates, news and instructions in my [telegram channel](https://t.me/WolfAURmanRedmi9Builds)


## List of all updates for all devices: ##

> Daisy: 
- [CrDroid 9.x](https://github.com/WolfAURman/crdroid_ota_update/releases/download/crDroidAndroid-13.0-20221024-daisy-v9.0/crDroidAndroid-13.0-20221024-daisy-v9.0.zip) | [Changelog](https://github.com/WolfAURman/crdroid_ota_update/blob/master/changelog_daisy_9.x.txt) | [Flash step's list](https://telegra.ph/Flash-steps-Mi-A2-Lite-daisy-07-18)
- [CrDroid 8.x](https://github.com/WolfAURman/crdroid_ota_update/releases/download/crDroidAndroid-12.1-20221014-daisy-v8.10/crDroidAndroid-12.1-20221014-daisy-v8.10.zip) | [Changelog](https://github.com/WolfAURman/crdroid_ota_update/blob/master/changelog_daisy_8.x.txt) | [Flash step's list](https://telegra.ph/Flash-steps-Mi-A2-Lite-daisy-07-18)
- [CrDroid 7.x](https://github.com/WolfAURman/crdroid_ota_update/releases/download/crDroidAndroid-11.0-20221023-daisy-v7.23/crDroidAndroid-11.0-20221023-daisy-v7.23.zip) | [Changelog](https://github.com/WolfAURman/crdroid_ota_update/blob/master/changelog_daisy_7.x.txt) | [Flash step's list](https://telegra.ph/Flash-steps-Mi-A2-Lite-daisy-07-18)

> Lava:
- [CrDroid 9.x](https://github.com/WolfAURman/crdroid_ota_update/releases/download/crDroidAndroid-13.0-20220925-lava-v9.0/crDroidAndroid-13.0-20220925-lava-v9.0.zip) | [Changelog](https://github.com/WolfAURman/crdroid_ota_update/blob/master/changelog_lava_9.x.txt) | [Flash step's list](https://telegra.ph/Flash-steps-Redmi-9-lava-09-07)
- [CrDroid 8.x](https://github.com/WolfAURman/crdroid_ota_update/releases/download/crDroidAndroid-12.1-20221018-lava-v8.10/crDroidAndroid-12.1-20221018-lava-v8.10.zip) | [Changelog](https://github.com/WolfAURman/crdroid_ota_update/blob/master/changelog_lava_8.x.txt) | [Flash step's list](https://telegra.ph/Flash-steps-Redmi-9-lava-09-07)
- [CrDroid 7.x](https://github.com/WolfAURman/crdroid_ota_update/releases/download/crDroidAndroid-11.0-20221018-lava-v7.23/crDroidAndroid-11.0-20221018-lava-v7.23.zip) | [Changelog](https://github.com/WolfAURman/crdroid_ota_update/blob/master/changelog_lava_7.x.txt) | [Flash step's list](https://telegra.ph/Flash-steps-Redmi-9-lava-07-14)

> Onclite
- [CrDroid 8.x](https://github.com/WolfAURman/crdroid_ota_update/releases/download/crDroidAndroid-12.1-20221013-onclite-v8.10/crDroidAndroid-12.1-20221013-onclite-v8.10.zip) | [Changelog](https://github.com/WolfAURman/crdroid_ota_update/blob/master/changelog_onclite_7.x.txt) | [Flash step's list](https://telegra.ph/Flash-steps-Redmi-7-onclite-10-06)
- [CrDroid 7.x](https://github.com/WolfAURman/crdroid_ota_update/releases/download/crDroidAndroid-11.0-20221012-onclite-v7.23/crDroidAndroid-11.0-20221012-onclite-v7.23.zip) | [Changelog](https://github.com/WolfAURman/crdroid_ota_update/blob/master/changelog_onclite_8.x.txt) | [Flash step's list](https://telegra.ph/Flash-steps-Redmi-7-onclite-10-06)

## Creating json ##

We put create json.sh to the home folder with your source code. Example: ~/android/crdroidx.x

Then make the file executable:
```
chmod +x createjson.sh
```
After that, run it:
```
./createjson.sh
```

Get the devicename output.json, mission accomplished!

## automatic uploading using a script

copy the file ```auto_createjson_x.x.sh``` to your working source folder, make it executable ```chmod +x auto_createjson_x.x.sh``` and then run it ```./auto_createjson_x.x.sh```
