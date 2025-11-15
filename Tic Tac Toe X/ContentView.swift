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
            LazyVGrid(
                   columns: Array(repeating: GridItem(.fixed(120)), count: 3)
               ) {
                   ForEach(0..<9) { index in
                       RoundedRectangle(cornerRadius: 30)
                           .foregroundColor(.blue)
                           .frame(width: 120, height: 120)
                   }
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
