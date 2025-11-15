//
//  ContentView.swift
//  Tic Tac Toe X
//
//  Created by stephanie rocha marquez on 11/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = Array(repeating: "", count: 9)
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.largeTitle)
                .bold()
            LazyVGrid(
                columns: Array(repeating: GridItem(.fixed(120)), count: 3)
            ) {
                
                ForEach(0..<9) { index in
                    ZStack {
                        Color.blue
                        Text(moves[index])
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                    }
                    .frame(width: 120, height: 120)
                    .cornerRadius(30)
                    .onTapGesture {
                        moves[index] = "X"
                    }
                }
                
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
