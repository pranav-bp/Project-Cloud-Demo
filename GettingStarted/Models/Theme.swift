//
//  Theme.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/19/24.
//

import SwiftUI

protocol ThemeProtocol {
    var backgroundColor: Color { get }
    var textColor: Color { get }
    var buttonColor: Color { get }
}

struct Theme: ThemeProtocol {
    let backgroundColor: Color
    let textColor: Color
    let buttonColor: Color
}
