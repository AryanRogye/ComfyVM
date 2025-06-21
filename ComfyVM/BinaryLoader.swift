//
//  BinaryLoader.swift
//  ComfyVM
//
//  Created by Aryan Rogye on 6/21/25.
//

import Foundation

final class BinaryLoader: ObservableObject {
    
    init() {
        loadHelloX86Binary()
    }
    
    
    // MARK: - Internals
    
    private func loadHelloX86Binary() {
        if let url = Bundle.main.url(forResource: "hello_x86", withExtension: nil) {
            print("Binray Found in Bundle: \(url.path)")
            
            do {
                let binaryData = try Data(contentsOf: url)
                let bytes = [UInt8](binaryData)
                print("Loaded Binary \(bytes.count) bytes")
            } catch {
                print("Failed To Load Binary")
            }
            
        } else {
            print("Binary Not Found In Bundle")
        }
        
        print("Reached End of LoadHelloX86Binary")
    }
}
