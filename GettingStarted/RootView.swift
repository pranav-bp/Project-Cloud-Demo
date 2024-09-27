//
//  RootView.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/18/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var authService: AuthenticationService

    var body: some View {
        NavigationStack {
            if authService.isAuthenticated {
//                NotesListView()
                ProjectListView()
            } else {
                LoginView()
            }
        }
    }
}

