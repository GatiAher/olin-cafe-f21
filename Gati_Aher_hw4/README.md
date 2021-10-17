# Combination Logic Review + HDL Practice: ALU

An arithmetic logic unit is a critical building block for a CPU. It does a variety of mathematical operations on two inputs (addition, subtraction, comparison, etc.). FI built a 32 bit wide 32:1 MUX and a 32 bit wide adder

## Description of how modules were implemented

**Module add32.sv**

I implemented a 32-bit carry lookahead adder (CLA) following the logic and circuit diagram given on page 240 of H&H.

The 32-bit adder is comprised of the following modules:

* `add32.sv`: Dasiy chain of 8 4-bit CLA blocks
    * `adder_cla_4.sv`: Dasiy chain of 1-bit RC adder to 4-bit (RC) adder to calculate the block sum
        * `adder_1.sv`: 1-bit ripple carry RC adder that can be daisy chained
    * `gen_prop_4.sv`: 4-bit generate-propagate logic to calculate the block carry out bit 

**Module mux32.sv**

I implemented a 32-bit wide 32:1 MUX by generalizing the hierarchial logic for wider MUXs detailed on page 83 of H&H. The 32 bit MUX accepts a 32-bit data bus and a 5-bit select signal with total of 32 possible values. The select signal chooses which bit on the data bus to output (e.g. select=0 --> first data bit, select=1 --> second data bit, etc.).

The 32:1 MUX is comprised of the following modules:

* `mux32.sv`: uses `select[4]` to choose between outputs of 2 1:16 MUXs
* `mux_16.sv`: uses `select[3]` to choose between outputs of 2 1:8 MUXs
* `mux_8.sv`: uses `select[2]` to choose between outputs of 2 1:4 MUXs
* `mux_4.sv`: uses `select[1]` to choose between outputs of 2 1:2 MUXs that each use `select[0]` as select signal to a 2:1 MUX

I use bit-swizzling to choose the correct input bits for each level of MUXs. 

## Description of testing mux32

1. Write down truth table of 4:1 MUX given alternating data bus (1010)
2. Implement and test 4:1 MUX with alternating data bus (1010)
3. Repeat steps 1-2 for 8:1 MUX
4. Repeat steps 1-2 for 16:1 MUX
5. Repeat steps 1-2 for 32:1 MUX

## How to run tests

All tests can be run with commands in the Makefile.

Test `add32.sv`
```
make test_add32
```

Test `mux32.sv`
```
make test_mux32
```

---

Test adder submodule 1-bit adder
```
make test_adder_1
```

Test MUX submodules
```
make test_mux_4
make test_mux_8
make test_mux_16
```