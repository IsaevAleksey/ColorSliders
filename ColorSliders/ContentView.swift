//
//  ContentView.swift
//  ColorSliders
//
//  Created by Алексей Исаев on 15.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red = Double.random(in: 0...255).rounded()
    @State private var green = Double.random(in: 0...255).rounded()
    @State private var blue = Double.random(in: 0...255).rounded()
    
    @FocusState private var keyboard: Bool
    
    var body: some View {
        ZStack {
            Color(.systemCyan)
                .ignoresSafeArea()
                .onTapGesture {
                    keyboard = false
                }
            VStack {
                ColorView(red: red, green: green, blue: blue)
                VStack {
                    SliderView(value: $red, color: .red)
                    SliderView(value: $green, color: .blue)
                    SliderView(value: $blue, color: .green)
                }
                .focused($keyboard)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            keyboard = false
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

