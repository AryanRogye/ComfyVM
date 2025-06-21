#!/bin/bash

INPUT="$1"
OUTPUT_DIR=$(dirname "$INPUT")
OUTPUT_FILE="$OUTPUT_DIR/elf_header.txt"

greadelf -h "$INPUT" > "$OUTPUT_FILE"
