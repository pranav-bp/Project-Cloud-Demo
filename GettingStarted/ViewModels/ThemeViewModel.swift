//
//  ThemeViewModel.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/19/24.
//

import SwiftUI

@MainActor
class ThemeViewModel: ObservableObject {
    
    @Published private(set) var currentTheme: Theme
    
    let themes: [Theme] = [
        Theme(backgroundColor: .primary, textColor: .yellow, buttonColor: .red),
        Theme(backgroundColor: .pink, textColor: .white, buttonColor: .teal),
        Theme(backgroundColor: .green, textColor: .white, buttonColor: .purple),
    ]
    
    init() {
        self.currentTheme = themes[0]
    }
    
    func switchTheme(to newTheme: Theme) {
        self.currentTheme = newTheme
    }
}

