# 🖥️ ComfyVM

ComfyVM is a personal learning project to understand how emulators work — from instruction decoding to memory handling and syscall simulation.

The goal is to build a minimal x86 virtual machine in Swift that can load and execute real 32-bit Linux binaries (starting with `hello world` written in C).

---

## Why?

> I was inspired — and honestly amazed — by [iSH](https://github.com/ish-app/ish).  
> I wanted to fork it and poke around, but quickly realized it was too complex for me to follow.  
> So I decided to build my own — **from scratch** — in Swift, at my pace, to really understand every layer.

This is not about performance or compatibility — it's about **learning**, experimenting

## My Use Case

> I want to attach to an ADB shell **directly from my iOS device**,  
> but only inside an environment **I fully understand and built myself.**  
> No sandbox escape, no full Linux — just my own emulator running binaries, my way.

The idea is:
- Build a fake Linux environment using an emulator
- Compile `adb` (or minimal tools) for x86
- Run it inside my VM to connect to real Android devices  
All from within a Swift app on iOS.

---


## References

- [the elf 101 guide](https://linux-audit.com/elf-binaries-on-linux-understanding-and-analysis/)
