<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This architecture explores a lightweight alternative for generating values with potential applications in hardware hash functions. It implements an 8-bit ARX mixer that transforms each 8-bit input into a unique 8-bit output. The design implements a permutation of all 256 possible 8-bit values, ensuring a one-to-one mapping without collisions.

## How to test

Insert 8-bit numbers, and you will get 8-bits as an output, with a one-to-one mapping without collisions.c

We emulate TinyHash's behavior using C code, available here: [Link](https://drive.google.com/file/d/1V6Rg9BzgG4DnIiHkh1yTmEiHju5fDaJ0/view?usp=drive_link). The resulting output values were added to the test suite in `test/test.py` as the variable `vector`. All test vectors produced matching results between the C emulation and our Verilog implementation.

## External hardware

Not required

## Acknowledge

We thank Universidad Distrital Francisco José de Caldas for providing us with the opportunity to participate in this project.
