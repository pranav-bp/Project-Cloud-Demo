//
//  ProjectsData.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/27/24.
//

import Foundation

class ProjectsData {
    
    static let dummyProjects: [Project] = [
        Project(name: "Apple Campus Project",
                status: "Active",
                companyInfo: ["Apple Inc.", "1 Infinite Loop", "Cupertino", "CA", "USA"],
                clientInfo: ["Tim Cook", "CEO", "Apple Inc."],
                projectInfo: ["It was a rainy day", "The mositure was high"],
                reportInfo: ["Weekly Report", "Construction Phase", "Approved"],
                selectedId: "ACP",
                fieldProfessional: "John Doe"),
        
        Project(name: "Tesla Gigafactory Project",
                status: "Inactive",
                companyInfo: ["Tesla", "3500 Deer Creek Road", "Palo Alto", "CA", "USA"],
                clientInfo: ["Elon Musk", "CEO", "Tesla"],
                projectInfo: ["It was a sunny day", "The mositure was low"],
                reportInfo: ["Daily Report", "Battery Production Phase", "Pending"],
                selectedId: "TGF",
                fieldProfessional: "Sarah Johnson"),
        
        Project(name: "SpaceX Starship Project",
                status: "Inactive",
                companyInfo: ["SpaceX", "Rocket Road", "Hawthorne", "CA", "USA"],
                clientInfo: ["Gwynne Shotwell", "President", "SpaceX"],
                projectInfo: ["It was a cloudy day", "The density was high"],
                reportInfo: ["Monthly Report", "Testing Phase", "In Progress"],
                selectedId: "SSP",
                fieldProfessional: "Mike Brown"),
        
        Project(name: "Google HQ Expansion",
                status: "Completed",
                companyInfo: ["Google", "1600 Amphitheatre Parkway", "Mountain View", "CA", "USA"],
                clientInfo: ["Sundar Pichai", "CEO", "Google"],
                projectInfo: ["It was a gloomy day", "The density was too low."],
                reportInfo: ["Quarterly Report", "Planning Phase", "Approved"],
                selectedId: "GHE",
                fieldProfessional: "Emily Davis")
    ]
}
