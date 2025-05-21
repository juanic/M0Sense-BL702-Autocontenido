# y for printf on usb_cdc_acm and n for printf on uart 
SUPPORT_USBSTDIO_ENABLE=y


APP=rtos_demo
APP_DIR=m0sense_apps
if [ "$1" != "" ]; then

    if [ "$1" == "clean" ]; then
    	rm -rf m0sense_apps/**/submodule_commit_info.txt bl_mcu_sdk/{build,out}
        echo "clean the produced files!"
        exit
    fi

    if [ "$1" == "patch" ]; then
    	cd bl_mcu_sdk
        git switch -c patch
        git reset --hard origin/release_v1.4.5
        git am --keep-cr ../misc/sdk_patch/*.patch
        echo "Apply patch for you!"
        cd ..
        exit
    fi

    if [ ! -d "$1" -o ! -f "$1/CMakeLists.txt" ]; then
        echo "no this app project \"$1\"!"
        exit
    fi

    APP=${1##*/}
    APP_DIR=${1%%/$APP}

fi

if [ "${APP_DIR%%/*}" != "m0sense_apps" -a "$SUPPORT_USBSTDIO_ENABLE" == "y" ]; then
    echo "not support \`SUPPORT_USBSTDIO_ENABLE=y\` yet, please disable it in build.sh!"
    exit
fi

cd bl_mcu_sdk
if [ $SUPPORT_USBSTDIO_ENABLE == "y" -a $(git rev-parse HEAD) == $(git rev-parse origin/release_v1.4.5) ]; then
git am --signoff --keep-cr ../misc/sdk_patch/*.patch
echo "Apply patch for you!"
fi

make APP=$APP APP_DIR=../$APP_DIR BOARD=bl702_iot  SUPPORT_FLOAT=y SUPPORT_USBSTDIO_ENABLE=$SUPPORT_USBSTDIO_ENABLE
cd ..

TARGET=bl_mcu_sdk/out/$APP_DIR/$APP/${APP}_bl702.bin
ls -alh $TARGET

# extra
if [ ! "$APP" == "m0sense_boot" ]; then
    UF2_CVT="misc/utils/uf2_convert"
    $UF2_CVT $TARGET uf2_demos/${APP}.uf2
fi