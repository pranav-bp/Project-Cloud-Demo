//
//  NotesListView.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/17/24.
//

import SwiftUI

struct NotesListView: View {
    
    @EnvironmentObject private var authenticationService: AuthenticationService
    
    @EnvironmentObject var themeViewModel: ThemeViewModel
    
    @State var notes: [Note] = []
    
    @State private var showThemes: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
//                List {
//                    if notes.isEmpty {
//                        Text("No notes")
//                    }
//                    ForEach(notes, id: \.id) { note in
//                        NoteView(note: note)
//                            .listRowBackground(themeViewModel.currentTheme.backgroundColor)
//                    }
//                }
                Text("Hello, World")
                    .foregroundStyle(themeViewModel.currentTheme.textColor)
            }
            .background(themeViewModel.currentTheme.backgroundColor)
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .background(themeViewModel.currentTheme.backgroundColor)
            
            Button {
                showThemes = true
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .foregroundStyle(themeViewModel.currentTheme.buttonColor)
            }
            .padding()
        }
        .sheet(isPresented: $showThemes, content: {
            ThemesListView()
        })
        .navigationTitle("Notes")
        .toolbar {
            Button("Sign Out") {
                Task {
                    await authenticationService.signOut()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        NotesListView(notes: [
            Note(
                name: "First note",
                description: "This is an example of a long note description that has \nexplicit line breaks.",
                image: "mic"
            ),
            Note(
                name: "Second note",
                description: "This is a short description.",
                image: "phone"
            ),
            Note(
                name: "Third note"
            )
        ])
        .environmentObject(AuthenticationService())
        .environmentObject(ThemeViewModel())
    }
}
