//
//  LandingView.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/18/24.
//

import AuthenticationServices
import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    
    @State private var password: String = ""

    @EnvironmentObject private var authService: AuthenticationService

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .frame(height: 42)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 42)
                
                Button(action: {
                    Task {
                        await authService.signIn(username: username, password: password)
                    }
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(8)
                
                if !authService.errorMessage.isEmpty {
                    Text(authService.errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                if authService.isAuthenticated {
                    Text("Login Successful!")
                        .foregroundColor(.green)
                        .padding()
                }
            }
            .padding()
        }
    }
}


#Preview {
    LoginView()
        .environmentObject(AuthenticationService())
}
