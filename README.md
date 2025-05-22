# 🧠 M0sense BL702 Example

Este repositorio contiene ejemplos de aplicación para la familia de microcontroladores **Bouffalo Lab BL702**, utilizando el SDK oficial (`bl_mcu_sdk`) y el toolchain RISC-V en Windows. La idea del repositorio
es que sea lo más autocontenido posible, creado a partir del [original].(https://github.com/sipeed/M0sense_BL702_example)

---

## 📦 Estructura del repositorio

```
M0sense_BL702_example/
├── 3D_models                    # Modelo 3D de la placa M0Sense
├── Dosc                         # Documentación de la placa, datasheets
├── bl_mcu_sdk/                  # SDK oficial con drivers y ejemplos de uso
├── m0sense_apps/                # Aplicaciones de ejemplo
├── misc/
│   ├── sdk_patch/                # Parches opcionales para el SDK
│   └── utils/uf2_convert         # Conversor bin → UF2
├── build_sc.sh                   # Script de compilación modificado
├── build.sh                      # Script de compilación original
├── m0sense_udisk_bl702_v0.1.bin  # Binario para programar la placa usando uf2, usando BouffaloLabDevCube 
└── README.md
```

---

## 🖥️ Requisitos

- **Windows 10 o superior**
- [Git for Windows](https://git-scm.com/download/win) (incluye Git Bash)
- Toolchain RISC-V precompilada para Windows
- `make` (instalable con [MSYS2](https://www.msys2.org/) o Cygwin)

---

## 🛠️ Instalación paso a paso

### 1. Clonar este repositorio

```bash
git clone https://github.com/tu-usuario/M0sense_BL702_example.git
cd M0sense_BL702_example
```

---

### 2. Descargar e instalar la toolchain RISC-V para Windows

1. Ir a:  
   👉 https://github.com/sifive/freedom-tools/releases

2. Buscar un ZIP que contenga:  
   `riscv64-unknown-elf-toolchain-*-x86_64-w64-mingw32.zip` 

3. Extraer en una carpeta como:  
   `C:\riscv64-tools\`

4. Verificar que exista:  
   `C:\riscv64-tools\bin\riscv64-unknown-elf-gcc.exe`


---

### 3. Configurar el entorno (`~/.bashrc`)

Abrí Git Bash y agregá esto a tu `~/.bashrc`:

```bash
export PATH="/c/riscv64-tools/bin:$PATH"
```

Recargá el entorno:

```bash
source ~/.bashrc
```

Verificá:

```bash
riscv64-unknown-elf-gcc --version
```

---

### 4. Instalar `make` (si no lo tenés)

Si usás **MSYS2**:

```bash
pacman -Syu
pacman -S make
```

Si usás **Cygwin**, asegurate de instalar el paquete `make` durante la instalación.

---

## 🚀 Compilación

Desde la raíz del proyecto, ejecutá:

```bash
./build.sh m0sense_apps/blink/blink_baremetal
```

Al finalizar, el binario generado estará en:

```
bl_mcu_sdk/out/m0sense_apps/blink/blink_baremetal/blink_baremetal_bl702.bin
```

Si el proyecto no genera errores, también se convertirá automáticamente a formato `.uf2`.

---

## 🧪 Comandos útiles

| Comando                          | Descripción                                     |
|----------------------------------|-------------------------------------------------|
| `./build.sh clean`              | Elimina archivos de compilación previos        |
| `./build.sh patch`              | Aplica los parches ubicados en `misc/sdk_patch` |

---

## 🛠️ Estructura del build

- El script **no requiere que `bl_mcu_sdk` sea un repositorio Git** (a diferencia del original)
- Los parches se aplican solo si están presentes (`*.patch`)        (en el original falla la aplicación de los parches, las modificaciones se hicieron a mano, principalmente para poder usar la pantalla, esta fue una de las razones de hacerlo "autocontenido")
- El `make` se ejecuta con la configuración del proyecto y placa

---

## 🐛 Solución de problemas

| Problema                                  | Solución                                                 |
|-------------------------------------------|----------------------------------------------------------|
| `make: command not found`                 | Instalá `make` desde MSYS2 o Cygwin                      |
| `riscv64-unknown-elf-gcc: command not found` | Verificá que el PATH a la toolchain esté bien seteado   |
| `.bin` no generado                        | Verificá los errores del compilador                     |

---

## 📤 Programación del BL702

Podés cargar el archivo `.bin` o `.uf2` usando:

- **BLDevCube** (oficial de Bouffalo Lab)
- **Arrastrar el `.uf2`** si tu placa tiene soporte de USB Drag & Drop

---

## 📜 Licencia

MIT - este repositorio es libre para uso educativo o experimental.

