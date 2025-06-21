#!/bin/bash

INPUT="$1"
OUTPUT_DIR=$(dirname "$INPUT")
OUTPUT_FILE="$OUTPUT_DIR/elf_output.txt"

greadelf -a "$INPUT" > "$OUTPUT_FILE"
