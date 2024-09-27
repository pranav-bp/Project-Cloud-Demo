//
//  ActionButton.swift
//  MyGauge
//
//  Created by Pranav Bellam Prasad on 9/26/24.
//

import SwiftUI

struct ActionButton: View {
    
    let title: String
    let image: String
    let bgColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack(spacing: 8) {
                Image(systemName: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.white)
                
                Text(title)
                    .bold()
                    .foregroundStyle(.white)
                    .font(.title2)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .frame(height: 42)
            .background(bgColor)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .shadow(color: Color.black.opacity(0.3), radius: 20)
        })
    }
}

#Preview {
    ActionButton(title: "Delete", image: "trash.fill", bgColor: .red, action: {
        // Action Closure
    })
}
