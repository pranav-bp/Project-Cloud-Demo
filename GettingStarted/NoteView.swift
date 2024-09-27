//
//  NoteView.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/17/24.
//

import SwiftUI

struct NoteView: View {
    @State var note: Note
    @EnvironmentObject var themeViewModel: ThemeViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 5.0) {
            VStack(alignment: .leading, spacing: 5.0) {
                Text(note.name)
                    .bold()
                    .foregroundStyle(themeViewModel.currentTheme.textColor)
                if let description = note.description {
                    Text(description)
                        .foregroundStyle(themeViewModel.currentTheme.textColor)
                }
            }
            
            if let image = note.image {
                Spacer()
                
                Divider()
                
                Image(systemName: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .foregroundStyle(themeViewModel.currentTheme.buttonColor)
                
            }
        }
    }
}

#Preview {
    NoteView(
        note: Note(
            name: "Hello, World!",
            description: "What's up?"
        )
    )
    .environmentObject(ThemeViewModel())
}
