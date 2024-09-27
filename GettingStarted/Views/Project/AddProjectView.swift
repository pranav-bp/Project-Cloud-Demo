//
//  AddProjectView.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/27/24.
//

import SwiftUI

struct AddProjectView: View {
    
    @Environment(\.dismiss) var dismiss
    
    // Access the project manager from the environment
    @EnvironmentObject var projectManager: ProjectManager
    
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var companyInfo: [String] = Array(repeating: "", count: 5)
    @State private var clientInfo: [String] = Array(repeating: "", count: 5)
    @State private var projectInfo: [String] = Array(repeating: "", count: 5)
    @State private var reportInfo: [String] = Array(repeating: "", count: 3)
    @State private var fieldProfessional: String = ""
    
    @Binding var pickerSelection: String
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        CustomTextFieldView(text: $name, prompt: "Project Name")
                        
                        
                        Text("Company Info")
                            .font(.headline)
                        ForEach(0..<5, id: \.self) { index in
                            CustomTextFieldView(text: $companyInfo[index], prompt: "Company Info \(index + 1)")
                        }
                        
                        
                        Group {
                            Text("Client Info")
                                .font(.headline)
                            ForEach(0..<5, id: \.self) { index in
                                CustomTextFieldView(text: $clientInfo[index], prompt: "Client Info \(index + 1)")
                            }
                        }
                        
                        Group {
                            Text("Project Info")
                                .font(.headline)
                            ForEach(0..<5, id: \.self) { index in
                                CustomTextFieldView(text: $projectInfo[index], prompt: "Project Info \(index + 1)")
                            }
                        }
                        
                        Group {
                            Text("Report Info")
                                .font(.headline)
                            ForEach(0..<3, id: \.self) { index in
                                CustomTextFieldView(text: $reportInfo[index], prompt: "Report Info \(index + 1)")
                            }
                        }
                        
                        CustomTextFieldView(text: $fieldProfessional, prompt: "Field Professional")

                    }
                    .padding()
                }
                
                VStack {
                    Spacer()
                    
                    ActionButton(title: "Save Project", image: "camera.fill", bgColor: .green) {
                        saveProject()
                    }
                }
                .padding()
            }
            .navigationTitle("Add Project")
        }
    }
    
    private func saveProject() {
        // Create a new project instance
        let newProject = Project(
            name: name,
            companyInfo: companyInfo.map { $0.isEmpty ? nil : $0 }, // Handle empty strings as nil
            clientInfo: clientInfo.map { $0.isEmpty ? nil : $0 },
            projectInfo: projectInfo.map { $0.isEmpty ? nil : $0 },
            reportInfo: reportInfo.map { $0.isEmpty ? nil : $0 },
            fieldProfessional: fieldProfessional
        )
        
        // Append the new project to the project manager
        projectManager.projects.append(newProject)
        pickerSelection = "Inactive"
        dismiss()
    }
}

#Preview {
    AddProjectView(pickerSelection: .constant("Active"))
}
