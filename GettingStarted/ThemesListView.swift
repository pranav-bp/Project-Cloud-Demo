//
//  ThemesListView.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/19/24.
//

import SwiftUI

struct ThemesListView: View {
    
    @EnvironmentObject var themeViewModel: ThemeViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            List {
                ForEach(0..<themeViewModel.themes.count, id: \.self) { index in
                    ThemeCardView(theme: themeViewModel.themes[index])
                        .onTapGesture {
                            themeViewModel.switchTheme(to: themeViewModel.themes[index])
                            dismiss()
                        }
                }
            }
        }
    }
}

#Preview {
    ThemesListView()
        .environmentObject(ThemeViewModel())
}
