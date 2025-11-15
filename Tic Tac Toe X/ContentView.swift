//
//  ContentView.swift
//  Tic Tac Toe X
//
//  Created by stephanie rocha marquez on 11/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = Array(repeating: "", count: 9)
    @State private var xTurn = true
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
                        Color.white
                            .opacity(moves[index] == "" ? 1 : 0)
                        Text(moves[index])
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                    }
                    .frame(width: 120, height: 120)
                    .cornerRadius(30)
                    .onTapGesture {
                        withAnimation {
                            if moves[index] == "" {
                                moves[index] = xTurn ? "X" : "O"
                                xTurn.toggle()
                            }
                        }
                    }
                    .rotation3DEffect(.degrees(moves[index] == "" ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
