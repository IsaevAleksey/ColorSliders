//
//  SliderView.swift
//  ColorSliders
//
//  Created by Алексей Исаев on 15.03.2023.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Double
    @State private var text = ""

    let color: Color

    var body: some View {
        HStack {
            Text(value.formatted())
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
            TextFieldView(value: $value, text: $text)
        }
        .onAppear(){
            text = value.formatted()
        }
    }
}


struct TextFieldView: View {
    @Binding var value: Double
    @Binding var text: String
    @State private var showAlert = false
    
    var body: some View {
        TextField("", text: $text) { _ in
            withAnimation {
                setValue()
            }
        }
            .frame(width: 50)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            .alert("Error", isPresented: $showAlert, actions: {}) {
                Text("Incorrect value")
            }
    }
    
    private func setValue() {
        if let text = Double(text), (0...255).contains(text) {
            value = text
            return
        }
        showAlert.toggle()
        value = 0
        text = "0"
    }
}



struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(40), color: .red)
    }
}
