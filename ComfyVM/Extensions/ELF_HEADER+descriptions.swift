//
//  ELF_HEADER+descriptions.swift
//  ComfyVM
//
//  Created by Aryan Rogye on 6/21/25.
//

extension ELF_HEADER {
    
    public func printLikeReadElf() {
        print("ELF Header:")
        print("  Magic:                             \(e_ident.map { String(format: "%02x", $0) }.joined(separator: " "))")
        print("  Class:                             \(e_ident[4] == 1 ? "ELF32" : "ELF64")")
        print("  Data:                              \(e_ident[5] == 1 ? "2's complement, little endian" : "2's complement, big endian")")
        print("  Version:                           \(e_ident[6]) (current)")
        print("  OS/ABI:                            \(osabiDescription(e_ident[7]))")
        print("  ABI Version:                       \(e_ident[8])")
        print("  Type:                              \(elfTypeDescription(e_type)) (\(e_type))")
        print("  Machine:                           \(machineDescription(e_machine)) (\(e_machine))")
        print("  Version:                           0x\(String(format: "%x", e_version))")
        print("  Entry point address:               0x\(String(format: "%08x", e_entry))")
        print("  Start of program headers:          \(e_phoff) (bytes into file)")
        print("  Start of section headers:          \(e_shoff) (bytes into file)")
        print("  Flags:                             0x\(String(format: "%x", e_flags))")
        print("  Size of this header:               \(e_ehsize) (bytes)")
        print("  Size of program headers:           \(e_phentsize) (bytes)")
        print("  Number of program headers:         \(e_phnum)")
        print("  Size of section headers:           \(e_shentsize) (bytes)")
        print("  Number of section headers:         \(e_shnum)")
        print("  Section header string table index: \(e_shstrndx)")
    }
    
    internal func osabiDescription(_ val: UInt8) -> String {
        switch val {
        case 0: return "UNIX - System V"
        case 3: return "UNIX - GNU"
        default: return "Unknown (0x\(String(format: "%02x", val)))"
        }
    }
    
    internal func elfTypeDescription(_ type: UInt16) -> String {
        switch type {
        case 1: return "REL (Relocatable file)"
        case 2: return "EXEC (Executable file)"
        case 3: return "DYN (Shared object file)"
        default: return "Unknown"
        }
    }
    
    internal func machineDescription(_ machine: UInt16) -> String {
        switch machine {
        case 3: return "Intel 80386"
        case 62: return "AMD x86-64"
        default: return "Unknown"
        }
    }
}
