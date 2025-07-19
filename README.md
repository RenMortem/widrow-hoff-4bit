# widrow-hoff-4bit

# Widrow-Hoff Learning Rule - 4-bit Verilog Implementation

This project implements the Widrow-Hoff learning rule in Verilog using a 4-bit serial input system. It allows selecting between two learning rates (`alpha = 1` and `alpha = 0.5`) via a control signal.

## Features
- 4-bit serial input registration
- Configurable constant value `d`
- Two selectable learning rates via `sel`

## How to Use
1. Load 4 bits serially via signal `y` using `start`.
2. Set `pixel` high to begin calculation once 4 bits are loaded.
3. Select learning rate with `sel`
