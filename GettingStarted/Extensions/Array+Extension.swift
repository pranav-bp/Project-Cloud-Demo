//
//  Array+Extension.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/27/24.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
