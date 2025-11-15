//
//  ContentView.swift
//  Tic Tac Toe X
//
//  Created by stephanie rocha marquez on 11/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(120)), count: 3)) {
                Text("X")
                Text("X")
                Text("X")
                Text("X")
                Text("X")
                Text("X")
                Text("X")
                Text("X")
                Text("X")
            }

            Text("Tic Tac Toe")
                .font(.largeTitle)
                .bold()
                
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
