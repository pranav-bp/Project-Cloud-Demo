//
//  CustomTextField.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/27/24.
//

import SwiftUI

struct CustomTextFieldView: View {
    
    @Binding var text: String
    
    var prompt: String
    
    var body: some View {
        TextField("",
                  text: $text,
                  prompt: Text(prompt)
            .foregroundColor(.primary.opacity(0.3))
        )
        .frame(height: 42)
        .padding(.horizontal, 6)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

#Preview {
    CustomTextFieldView(text: .constant(""), prompt: "Line 1")
        .padding()
}
