//
//  ContentView.swift
//  SwiftUIState
//
//  Created by Arthur Soares on 23/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tapsNumber1 = 0
    @State private var tapsNumber2 = 0
    @State private var tapsNumber3 = 0
    var body: some View {
        VStack {
            Text("\(tapsNumber1 + tapsNumber2 + tapsNumber3)")
                .font(.system(size: 150))
                .fontWeight(.black)
            HStack {
                ButtonView(tapsNumber: $tapsNumber1, color: .purple)
                ButtonView(tapsNumber: $tapsNumber2, color: .blue)
                ButtonView(tapsNumber: $tapsNumber3, color: .green)
            }
            Button(action: {
                self.tapsNumber1 = 0
                self.tapsNumber2 = 0
                self.tapsNumber3 = 0
            }) {
                Text("Zerar")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.secondary)
                    .cornerRadius(10)
                    .padding()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonView: View {
    @Binding var tapsNumber: Int
    var color: Color
    
    var body: some View {
        Button( action: {
            self.tapsNumber += 1
        }) {
            Circle()
                .foregroundColor(color)
                .overlay(
                    Text("\(tapsNumber)")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                )
        }
    }
}
