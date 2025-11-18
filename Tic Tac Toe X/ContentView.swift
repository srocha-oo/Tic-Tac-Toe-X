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
    @State private var gameOver = false
    @State private var winMessage = ""
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
        .alert(isPresented: $gameOver) {
            Alert(title: Text(winMessage))
        }
        .onChange(of: moves) { oldValue, newValue in
            checkForWinner()
        }
    }

    private func checkForWinner() {
        checkLine(a: 0, b: 1, c: 2)
           checkLine(a: 3, b: 4, c: 5)
           checkLine(a: 6, b: 7, c: 8)
           checkLine(a: 0, b: 4, c: 8)
           checkLine(a: 6, b: 4, c: 2)
           if !(gameOver || moves.contains("")) {
               winMessage = "Cat's Game!"
               gameOver = true

        }
    }
    private func checkLine(a: Int, b: Int, c: Int) {
        if moves[a] != "" && moves[a] == moves[b] && moves[b] == moves[c] {
                   winMessage = "\(moves[a]) is winner!"
                   gameOver = true
               }
        }
}
#Preview {
    ContentView()
}
