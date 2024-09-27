//
//  ThemeViewCard.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/19/24.
//

import SwiftUI

struct ThemeCardView: View {
    let theme: Theme
    
    var body: some View {
        VStack {
            Text("Preview")
                .font(.headline)
                .foregroundColor(theme.textColor)
                .padding()
            
            Button(action: {}) {
                Text("Choose")
                    .foregroundColor(theme.buttonColor)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(theme.textColor)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
        }
        .frame(height: 150)
        .frame(maxWidth: .infinity)
        .background(theme.backgroundColor)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}


#Preview {
    ThemeCardView(theme: Theme(backgroundColor: .red, textColor: .white, buttonColor: .blue))
}
