//
//  GettingStartedApp.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/17/24.
//

import SwiftUI
import Amplify
import AWSCognitoAuthPlugin
import AWSAPIPlugin

@main
struct GettingStartedApp: App {
    
    @StateObject private var authService = AuthenticationService()
    @StateObject private var themeViewModel = ThemeViewModel()
    @StateObject private var projectManager = ProjectManager()
    
    init() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.add(plugin: AWSAPIPlugin())
            try Amplify.configure()
            print("Initialized Amplify, Auth and API");
        } catch {
            print("Could not initialize Amplify: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(projectManager)
                .environmentObject(themeViewModel)
                .environmentObject(authService)
                .task {
                    await authService.fetchSession()
                }
        }
    }
}
