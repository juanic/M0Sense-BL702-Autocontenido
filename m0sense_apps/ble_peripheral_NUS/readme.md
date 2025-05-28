# BLE Throughput Server - BL702

Este proyecto adapta el **Nordic UART Service (NUS)** a la plataforma BL702 usando FreeRTOS. Se trata de una implementación del servicio UART sobre Bluetooth Low Energy (BLE), permitiendo comunicación bidireccional entre un dispositivo embebido y una app BLE (por ejemplo, nRF Connect) mediante características GATT personalizadas.

## Características

- Basado en FreeRTOS.
- Implementación de servicios GATT personalizados:
  - Característica de lectura (`READ`)
  - Característica de escritura (`WRITE`)
- Gestión de conexiones BLE.
- Configuración automática del stack BLE y tareas asociadas.
- Soporte opcional para Over-the-Air Download (OAD).

## Requisitos

- Placa con microcontrolador **BL702** o compatible.
- Entorno de desarrollo con toolchain de Bouffalo Lab.
- Cliente BLE para prueba (Ej: **nRF Connect**).
- Conexión USB para logs vía `usb_stdio`.

## Compilación

Asegúrese de tener configurado el entorno de desarrollo Bouffalo Lab, incluyendo:

- SDK de BL702
- Toolchain (GCC RISC-V)
- CMake y Ninja (dependiendo del entorno)

```bash
mkdir build && cd build
cmake ..
make
```

## Uso

1. Flashear el firmware en la placa BL702.
2. Conectar al puerto USB y abrir un terminal (ej. `screen`, `minicom`, `PuTTY`).
3. Encender el dispositivo: este comenzará a anunciarse como periférico BLE.
4. Conectarse usando una app BLE como **nRF Connect**.
5. Leer/escribir desde las características BLE definidas.
6. Las notificaciones se enviarán automáticamente si se habilitan.

## UUIDs de Servicio y Características

| Tipo            | UUID                                    |
|-----------------|------------------------------------------|
| Servicio        | `6E400001-B5A3-F393-E0A9-E50E24DCCA9E`   |
| Característica READ | `6E400002-B5A3-F393-E0A9-E50E24DCCA9E` |
| Característica WRITE| `6E400003-B5A3-F393-E0A9-E50E24DCCA9E` |

## LED Status

- **Rojo encendido**: conectado.
- **Rojo apagado**: sin conexión BLE.
- **Verde parpadea brevemente**: recepción de datos por BLE.
- **Azul encendido**: inicio de la aplicación.

## Estructura del Proyecto

- `main.c`: configuración del sistema, inicialización de BLE y FreeRTOS.
- `ble_peripheral_tp_server.c`: implementación de la lógica del servicio BLE.
- `ble_peripheral_tp_server.h`: definición de UUIDs y funciones públicas del servidor BLE.

## Licencia

Distribuido bajo licencia Apache 2.0. Ver archivo fuente para más detalles.

---

Bouffalolab Team / Proyecto adaptado y documentado por [juani_c]
