#!/bin/bash

INPUT="$1"
OUTPUT_DIR=$(dirname "$1")
OUTPUT="$OUTPUT_DIR/$2"

i686-unknown-linux-gnu-gcc "$INPUT" -static -o "$OUTPUT"
