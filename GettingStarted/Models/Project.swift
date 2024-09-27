//
//  Project.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/27/24.
//

import Foundation

// This is a class, so it's a reference type.
class Project: Identifiable {
    let id: String = UUID().uuidString
    var name: String
    var status: String
    var companyInfo: [String?]
    var clientInfo: [String?]
    var projectInfo: [String?]
    var reportInfo: [String?]
    var selectedId: String
    var fieldProfessional: String
    
    // Default Initializer
    init(name: String = "InstroTek's Project",
         status: String = "Inactive",
         companyInfo: [String?] = [],
         clientInfo: [String?] = [],
         projectInfo: [String?] = [],
         reportInfo: [String?] = [],
         selectedId: String = "PCF",
         fieldProfessional: String = "Pranav Bellam Prasad")
    {
        self.name = name
        self.status = status
        self.companyInfo = companyInfo
        self.clientInfo = clientInfo
        self.projectInfo = projectInfo
        self.reportInfo = reportInfo
        self.selectedId = selectedId
        self.fieldProfessional = fieldProfessional
    }
}
