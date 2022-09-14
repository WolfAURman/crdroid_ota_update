# Unoffcial CrDroid OTA update. #

![crDroid-Custom-ROM-Logo](https://user-images.githubusercontent.com/93985232/170225142-a35db9ff-1427-4256-859c-14b255502c50.png)

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

copy the file ```auto_createjson_for_lava.sh``` to your working source folder, make it executable ```chmod +x auto_createjson_for_lava.sh``` and then run it ```./auto_createjson_for_lava.sh```

##
Fork from [CrDroid](https://github.com/crdroidandroid/android_vendor_crDroidOTA)
