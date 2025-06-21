#!/bin/bash

INPUT="$1"
OUTPUT_DIR=$(dirname "$INPUT")
OUTPUT="$OUTPUT_DIR/output.txt"

objdump -d "$INPUT" > "$OUTPUT"
