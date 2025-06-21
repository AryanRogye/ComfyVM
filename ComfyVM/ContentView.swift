//
//  ContentView.swift
//  ComfyVM
//
//  Created by Aryan Rogye on 6/21/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var binaryLoader = BinaryLoader()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
