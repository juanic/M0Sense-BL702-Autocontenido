# 🎵 M0Sense Tuner

Este proyecto implementa un **afinador de instrumentos musicales** utilizando una **transformada rápida de Fourier (FFT)** para detectar la frecuencia dominante de una señal de audio, y mostrar la nota musical correspondiente en una **pantalla LCD SPI** conectada a la placa **M0Sense (BL702)**.

![Afinador en pantalla](./docs/example.png) <!-- Asegúrate de subir una imagen real del dispositivo funcionando -->

---

## 🛠️ Plataforma

- **Placa:** M0Sense con SoC Bouffalo Lab BL702
- **Lenguaje:** C
- **IDE sugerido:** [Bouffalo Lab Dev Cube](https://dev.bouffalolab.com/) o VSCode + toolchain RISC-V
- **Pantalla:** LCD SPI (incluida en M0Sense)
- **Entrada de audio:** Micrófono analógico conectado al ADC interno

---

## ⚙️ Funcionalidad

- Captura de señal de audio a 16 kHz con ADC y DMA
- Cálculo de la **FFT** en tiempo real con la librería `riscv_dsp`
- Detección de la frecuencia dominante
- Conversión de frecuencia a nota musical (basada en tabla cromática de C0 a B7)
- Visualización en pantalla con:
  - Letra de la nota
  - Frecuencia detectada
  - Indicador gráfico de afinación (estilo afinador cromático)

<video src="./docs/afinador-demo.mp4" controls width="400"></video>

---

## 📷 Interfaz visual

La pantalla LCD muestra:

- Frecuencia actual (Hz)
- Nota musical correspondiente (A, A#, B, ...)

---

## 🧪 Requisitos

- M0Sense con firmware cargado
- Micrófono conectado a **ADC Channel 2**
- Librerías:
  - `riscv_math` / `riscv_dsp`
  - `hal_adc`, `hal_dma`, `hal_gpio`, `mcu_lcd`

---

## 📁 Estructura del proyecto

.
├── main.c                  # Código principal del afinador
├── io_def.h                # Definiciones de pines para el LCD y micrófono
├── docs/
│   └── example.png         # Imagen de la pantalla del afinador
└── README.md               # Este archivo