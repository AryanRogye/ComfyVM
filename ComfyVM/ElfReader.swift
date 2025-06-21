//
//  ElfReader.swift
//  ComfyVM
//
//  Created by Aryan Rogye on 6/21/25.
//

/// IDK SHIT about how to write a elf reader, so this is my best attempting with following along with a article
/// References:
/// - https://linux-audit.com/elf-binaries-on-linux-understanding-and-analysis/

import Foundation


/// ELF Headers are 52 Bytes
struct ELF_HEADER {
    var e_ident: [UInt8]       // 16    MAGIC
    var e_type: UInt16         // 2     TYPE
    var e_machine: UInt16      // 2     MACHINE
    var e_version: UInt32      // 4     VERSION
    var e_entry: UInt32        // 4     ENTRY_POINT
    var e_phoff: UInt32        // 4     START OF PROGRAM HEADERS
    var e_shoff: UInt32        // 4     START OF SECTION HEADERS
    var e_flags: UInt32        // 4     FLAGS
    var e_ehsize: UInt16       // 2     SIZE OF THIS HEADER
    var e_phentsize: UInt16    // 2     SIZE OF PROGRAM HEADERS
    var e_phnum: UInt16        // 2     NUMBER OF PROGRAM HEADERS
    var e_shentsize: UInt16    // 2     SIZE OF SECTION HEADERS
    var e_shnum: UInt16        // 2     NUMBER OF SECTION HEADERS
    var e_shstrndx: UInt16     // 2     SECTION HEADER STRING TABLE INDEX
    
    init() {
        self.e_ident = Array(repeating: 0, count: 16)
        self.e_type = 0
        self.e_machine = 0
        self.e_version = 0
        self.e_entry = 0
        self.e_phoff = 0
        self.e_shoff = 0
        self.e_flags = 0
        self.e_ehsize = 0
        self.e_phentsize = 0
        self.e_phnum = 0
        self.e_shentsize = 0
        self.e_shnum = 0
        self.e_shstrndx = 0
    }
    
    public func isUsingLittleEndian() -> Bool {
        return e_ident[5] == 1
    }    
}

final class ElfReader: ObservableObject {
    /// ALL Elf files must have 2 things a ELF Header and a File data
    ///
    @Published var elfHeader: ELF_HEADER!
    
    init(elfBytes: [UInt8]) {
        self.elfHeader = extractELFHeader(bytes: elfBytes)
        self.elfHeader.printLikeReadElf()
    }
    
    // MARK: - Internals
    private func extractELFHeader(bytes: [UInt8]) -> ELF_HEADER {
        precondition(bytes.count >= 52, "ELF file is too short to contain a valid header")
        
        let headerBytes = bytes[0..<52]
        
        /// Extracting the ELF Header
        var e_ident = Array(headerBytes[0..<16])
        let isLE = e_ident[5] == 1
        
        var header: ELF_HEADER = ELF_HEADER()
        
        header.e_ident = e_ident
        /// CHECK Extensions/Collection+ToUInt.swift for the toUInt16 and toUInt32 methods
        /// basically what they do is flip it or not flip it based on the little indian flag
        header.e_type      = headerBytes.toUInt16(start: 16, littleEndian: isLE)
        header.e_machine   = headerBytes.toUInt16(start: 18, littleEndian: isLE)
        header.e_version   = headerBytes.toUInt32(start: 20, littleEndian: isLE)
        header.e_entry     = headerBytes.toUInt32(start: 24, littleEndian: isLE)
        header.e_phoff     = headerBytes.toUInt32(start: 28, littleEndian: isLE)
        header.e_shoff     = headerBytes.toUInt32(start: 32, littleEndian: isLE)
        header.e_flags     = headerBytes.toUInt32(start: 36, littleEndian: isLE)
        header.e_ehsize    = headerBytes.toUInt16(start: 40, littleEndian: isLE)
        header.e_phentsize = headerBytes.toUInt16(start: 42, littleEndian: isLE)
        header.e_phnum     = headerBytes.toUInt16(start: 44, littleEndian: isLE)
        header.e_shentsize = headerBytes.toUInt16(start: 46, littleEndian: isLE)
        header.e_shnum     = headerBytes.toUInt16(start: 48, littleEndian: isLE)
        header.e_shstrndx  = headerBytes.toUInt16(start: 50, littleEndian: isLE)
        
        return header
    }
}
