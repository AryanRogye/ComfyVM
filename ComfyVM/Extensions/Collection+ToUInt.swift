//
//  Collection+ToUInt.swift
//  ComfyVM
//
//  Created by Aryan Rogye on 6/21/25.
//

import Foundation

extension Collection where Element == UInt8 {
    func toUInt16(start: Int, littleEndian: Bool) -> UInt16 {
        let startIdx = index(startIndex, offsetBy: start)
        let nextIdx = index(after: startIdx)
        let byte1 = self[startIdx]
        let byte2 = self[nextIdx]
        
        return littleEndian
        ? UInt16(byte1) | (UInt16(byte2) << 8)
        : (UInt16(byte1) << 8) | UInt16(byte2)
    }
    
    func toUInt32(start: Int, littleEndian: Bool) -> UInt32 {
        let b0 = self[index(startIndex, offsetBy: start)]
        let b1 = self[index(startIndex, offsetBy: start + 1)]
        let b2 = self[index(startIndex, offsetBy: start + 2)]
        let b3 = self[index(startIndex, offsetBy: start + 3)]
        
        return littleEndian
        ? UInt32(b0) | (UInt32(b1) << 8) | (UInt32(b2) << 16) | (UInt32(b3) << 24)
        : (UInt32(b0) << 24) | (UInt32(b1) << 16) | (UInt32(b2) << 8) | UInt32(b3)
    }
}
