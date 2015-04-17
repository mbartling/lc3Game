#!/bin/bash

find . -maxdepth 1 -name '*.asm' -exec lc3as {} \;

echo "I am done"
