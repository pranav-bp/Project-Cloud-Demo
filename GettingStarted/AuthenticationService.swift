//
//  AuthenticationService.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/18/24.
//

import Amplify
import AuthenticationServices
import AWSCognitoAuthPlugin

@MainActor
class AuthenticationService: ObservableObject {
    
    @Published var isAuthenticated = false
    
    @Published var errorMessage: String = ""
    
    func fetchSession() async {
        do {
            let result = try await Amplify.Auth.fetchAuthSession()
            isAuthenticated = result.isSignedIn
            print("Fetch session completed. isSignedIn = \(isAuthenticated)")
        } catch {
            print("Fetch Session failed with error: \(error)")
        }
    }
    
    // Async sign-in function
    func signIn(username: String, password: String) async {
        do {
            let signInResult = try await Amplify.Auth.signIn(username: username, password: password)
            await MainActor.run {
                if signInResult.isSignedIn {
                    self.isAuthenticated = true
                    self.errorMessage = ""
                } else {
                    self.errorMessage = "Sign-in failed"
                }
            }
        } catch {
            await MainActor.run {
                self.isAuthenticated = false
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func signOut() async {
        guard let result = await Amplify.Auth.signOut() as? AWSCognitoSignOutResult else {
            return
        }
        switch result {
        case .complete, .partial:
            isAuthenticated = false
        case .failed:
            break
        }
        print("Sign Out completed. isSignedIn = \(isAuthenticated)")
    }
}
