#!/usr/bin/env bash

# === CONFIGURACIÓN DE TOOLCHAIN ===
export PATH="/c/riscv64-tools/bin:$PATH"

SUPPORT_USBSTDIO_ENABLE=n
APP=rtos_demo
APP_DIR=m0sense_apps

# === PARÁMETROS ===
if [ "$1" != "" ]; then
    if [ "$1" == "clean" ]; then
        rm -rf m0sense_apps/**/submodule_commit_info.txt bl_mcu_sdk/{build,out}
        echo "✔ Archivos temporales eliminados"
        exit 0
    fi

    if [ "$1" == "patch" ]; then
        PATCH_DIR="misc/sdk_patch"
        if compgen -G "$PATCH_DIR/*.patch" > /dev/null; then
            echo "📦 Aplicando parches desde $PATCH_DIR..."
            for patch in $PATCH_DIR/*.patch; do
                patch -p1 -d bl_mcu_sdk < "$patch"
            done
            echo "✔ Parches aplicados"
        else
            echo "⚠️ No hay parches en $PATCH_DIR"
        fi
        exit 0
    fi

    if [ ! -d "$1" ] || [ ! -f "$1/CMakeLists.txt" ]; then
        echo "❌ Proyecto inválido: \"$1\""
        exit 1
    fi

    APP=${1##*/}
    APP_DIR=${1%%/$APP}
fi

# Verificación simple de soporte
if [ "${APP_DIR%%/*}" != "m0sense_apps" ] && [ "$SUPPORT_USBSTDIO_ENABLE" == "y" ]; then
    echo "⚠️ No se soporta SUPPORT_USBSTDIO_ENABLE=y fuera de m0sense_apps. Modificá build.sh si es necesario."
    exit 1
fi

cd bl_mcu_sdk || exit 1

make APP=$APP APP_DIR=../$APP_DIR BOARD=bl702_iot SUPPORT_FLOAT=y SUPPORT_USBSTDIO_ENABLE=$SUPPORT_USBSTDIO_ENABLE || {
  echo "❌ Error durante la compilación"
  exit 1
}

cd ..

# === RESULTADO ===
TARGET=bl_mcu_sdk/out/$APP_DIR/$APP/${APP}_bl702.bin

if [ ! -f "$TARGET" ]; then
    echo "❌ No se generó el archivo binario esperado: $TARGET"
    exit 1
fi

ls -alh "$TARGET"

# === UF2 opcional ===
if [ "$APP" != "m0sense_boot" ]; then
    UF2_CVT="misc/utils/uf2_convert"
    "$UF2_CVT" "$TARGET" "uf2_demos/${APP}.uf2"
fi
