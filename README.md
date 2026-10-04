# 8-bit ALU Design & Verification

An 8-bit Arithmetic Logic Unit (ALU) designed in Verilog and verified using a self-checking SystemVerilog testbench.

The project demonstrates RTL design and fundamental Design Verification concepts including reference-model-based checking, automated PASS/FAIL reporting, and immediate assertions.

## 🚀 Project Highlights

- 8-bit ALU with 16 operations
- 16-bit output
- Self-checking SystemVerilog testbench
- Reference model for expected-output generation
- Automated PASS/FAIL checking
- Immediate assertions for operation-level verification
- 65,536 directed test cases
- Simulation using Xilinx Vivado / XSIM

## ⚙️ ALU Operations

| Select | Operation |
|---|---|
| `0000` | ADD |
| `0001` | SUB |
| `0010` | MUL |
| `0011` | AND |
| `0100` | OR |
| `0101` | XOR |
| `0110` | NOT A |
| `0111` | NOT B |
| `1000` | NAND |
| `1001` | NOR |
| `1010` | XNOR |
| `1011` | Logical Shift Left |
| `1100` | Arithmetic Shift Left |
| `1101` | Logical Shift Right |
| `1110` | Arithmetic Shift Right |
| `1111` | Shift Left by 1 |

## 🧪 Verification Approach

The testbench generates:

- 16 operation-select values
- 64 values of input `A`
- 64 values of input `B`

Total:

**16 × 64 × 64 = 65,536 test cases**

Each test case is checked using a reference model.

```text
Stimulus
   ↓
DUT
   ↓
Output
   ↓
Reference Model
   ↓
Expected Output
   ↓
Compare
   ↓
PASS / FAIL
```
## 🛠️ Tools & Technologies

- Verilog
- SystemVerilog
- RTL Design
- Digital Logic
- Self-Checking Testbench
- Reference Model
- Immediate Assertions
- Xilinx Vivado / XSIM

## 📚 Verification Concepts Demonstrated

- Directed testing
- Reference-model-based verification
- Automated result checking
- Immediate assertions
- Testbench development
- PASS/FAIL statistics
- Functional coverage concepts

## 🔮 Future Improvements

- Constrained-random testing
- Functional coverage
- Cross coverage
- SystemVerilog classes
- Scoreboard
- Monitor
- Generator
- Interface
- UVM-based verification

## 👨‍💻 Author

**Deepak S**

ECE Student | VLSI Design & Design Verification | RTL Design

## 🎯 Project Focus

**RTL Design → Testbench → Reference Model → Assertions → Automated Verification**
