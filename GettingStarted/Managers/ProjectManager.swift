//
//  ProjectManager.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/27/24.
//

import Foundation

@MainActor
class ProjectManager: ObservableObject {
    
    @Published var projects: [Project] = []
    
    @Published var currentActiveProject: Project?
    
    // Initialize with dummy data
    init() {
        self.projects = ProjectsData.dummyProjects
    }
    
    func setActiveProject(_ project: Project) {
        currentActiveProject = project
        
        // Mark other projects as inactive here if needed
        for i in 0..<projects.count {
            if projects[i].status != "Completed" {
                projects[i].status = (projects[i].id == project.id) ? "Active" : "Inactive"
            }
        }
    }
    
    // Delete project from the list
    func deleteProject(_ project: Project) {
        if let index = projects.firstIndex(where: { $0.id == project.id }) {
            projects.remove(at: index)
        }
    }
}
