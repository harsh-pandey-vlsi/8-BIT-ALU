# 🖥️ 8-bit ALU Implementation on Nexys A7 (Artix-7)

## 📌 Project Overview
This project implements an **8-bit Arithmetic Logic Unit (ALU)** on the **Nexys A7-100T FPGA (Artix-7 XC7A100T-CSG324)**.  
The ALU supports **arithmetic, logical, and shift operations**, along with **status flag outputs**.  

It has been designed in **Verilog**, verified via **simulation (testbenches + waveforms)**, and deployed on the FPGA board using **Xilinx Vivado**.

---

## ⚙️ Features
- **Operations (selected using 3-bit `sel`):**
  - `000` → Addition (A + B)
  - `001` → Subtraction (A − B)
  - `010` → AND (A & B)
  - `011` → OR (A | B)
  - `100` → XOR (A ^ B)
  - `101` → Shift Left (A << 1)
  - `110` → Shift Right (A >> 1)
  - `111` → Default (Out = 0)

- **Status Flags:**
  - **Carry Flag** → indicates carry/borrow in addition/subtraction  
  - **Zero Flag** → high if result is 0  
  - **Negative Flag** → high if MSB of result is 1  
  - **Overflow Flag** → high if signed overflow occurs  

- **FPGA Mapping:**
  - Inputs `A` and `B` → Board switches  
  - Operation select (`sel`) → push buttons  
  - Output result → LEDs LD0–LD7  
  - Flags → LEDs LD8–LD11  


## 🔧 Tools and Requirements
- **Hardware:** Nexys A7-100T FPGA board (Artix-7)  
- **Software:** Xilinx Vivado Design Suite  
- **Language:** Verilog HDL  

---

## 🚀 How to Run the Project
### 1. Clone the repository
```bash
git clone https://github.com/yourusername/alu_8bit_fpga.git
cd alu_8bit_fpga
```

### 2. Open in Vivado
- Launch Vivado → Create new project → Add sources from `src/`  
- Add constraints from `constraints/nexys_a7.xdc`  
- Add testbenches from `tb/` (for simulation)  

### 3. Simulation
- Run behavioral simulation with `tb/tb_alu_8bit.v`  
- Observe results in the waveform viewer  

### 4. Synthesis & Implementation
- Run synthesis and implementation in Vivado  
- Generate bitstream (`.bit` file)  

### 5. Program FPGA
- Connect Nexys A7 via USB  
- Open **Hardware Manager** → Program device with generated bitstream  
- Test using board switches and LEDs  

---

## 🔍 Verification (Truth Table)
A detailed **truth table** is included in `docs/alu_truth_table.pdf`.  
Example cases:

| sel | A (hex) | B (hex) | Result (hex) | Carry | Zero | Neg | Overflow |
|-----|---------|---------|--------------|-------|------|-----|----------|
| 000 (ADD) | 0x0F | 0x0A | 0x19 | 0 | 0 | 0 | 0 |
| 000 (ADD) | 0x7F | 0x01 | 0x80 | 0 | 0 | 1 | 1 |
| 001 (SUB) | 0x0A | 0x0F | 0xFB | 1 | 0 | 1 | 0 |
| 010 (AND) | 0xF0 | 0x0F | 0x00 | 0 | 1 | 0 | 0 |
| 011 (OR)  | 0xF0 | 0x0F | 0xFF | 0 | 0 | 1 | 0 |

---


## 👨‍💻 Author
**Harsh Pandey**  
- 🎓 B.Tech ECE Pre Final Year  
- ⚡ Preparing for GATE 2026 (ECE)  
- 🤖 Interested in VLSI, FPGA, and Embedded Systems  

---

✨ If you like this project, feel free to ⭐ the repository and share!  
