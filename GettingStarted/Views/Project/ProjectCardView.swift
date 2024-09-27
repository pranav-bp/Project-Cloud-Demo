//
//  ProjectCardView.swift
//  MyGauge
//
//  Created by Pranav Bellam Prasad on 9/25/24.
//

import SwiftUI

struct ProjectCardView: View {
    
    @EnvironmentObject var projectManager: ProjectManager
    @Binding var pickerSelection: String
    
    let project: Project
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(project.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                if (project.status != "Inactive") {
                    Image(systemName: project.status == "Completed" ? "checkmark.circle.fill" : "circle.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(project.status == "Completed" ? .green : .blue)
                }
            }
            
            Text(((project.projectInfo[safe: 0]) ?? "Deafult Description") ?? "Deafult Description")
                .font(.body)
                .foregroundColor(.secondary)
            
            HStack {
                Text("Created By: \(project.fieldProfessional)")
                    .font(.callout)
                    .foregroundColor(.gray)
                
                Spacer()
            }
            .padding(.top, 5)
            
            if (project.status == "Inactive") {
                HStack {
                    Spacer()
                    
                    Button {
                        // Call the method to set project active
                        projectManager.setActiveProject(project)
                        
                        pickerSelection = "Active"
                        
                    } label: {
                        Text("Set as Active")
                            .font(.subheadline)
                            .bold()
                            .foregroundStyle(.red)
                    }
                }
            }
        }
        .padding()
        .background(.ultraThickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
            // Delete Action
            Button(role: .destructive) {
                //                projectManager.deleteProject(project)
            } label: {
                Label("Delete", systemImage: "trash")
            }
            
            // Update Action
            Button {
                // Placeholder action for updating the project
                //                projectManager.updateProject(project)
            } label: {
                Label("Update", systemImage: "pencil")
            }
            .tint(.blue)
        }
    }
}

#Preview {
    ProjectCardView(
        pickerSelection: .constant("Active"),
        project: Project(
            name: "InstroTek Office",
            status: "Completed"
        )
    )
    .padding()
}
