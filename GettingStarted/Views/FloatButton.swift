//
//  FloatButton.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/20/24.
//

import SwiftUI

struct FloatButtonView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    // Your form content goes here
                    ForEach(0..<50) { i in
                        Text("Item \(i)")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            
                    }
                }
                .padding()
            }
            
            VStack {
                Spacer()
                
                Button(action: {
                    // Save action
                }) {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .shadow(radius: 5)
                }
                .padding(.bottom, 10) // Padding above TabBar
            }
        }
    }
}

#Preview {
    FloatButtonView()
}
