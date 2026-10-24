<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This architecture explores a lightweight alternative for generating values with potential applications in hardware hash functions. It implements an 8-bit ARX mixer that transforms each 8-bit input into a unique 8-bit output. The design implements a permutation of all 256 possible 8-bit values, ensuring a one-to-one mapping without collisions.

## How to test

Insert 8-bit numbers, and you will get 8-bits as an output, with a one-to-one mapping without collisions.

## External hardware

List external hardware used in your project (e.g. PMOD, LED display, etc), if any
