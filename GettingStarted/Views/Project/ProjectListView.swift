//
//  ProjectListView.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/27/24.
//

import SwiftUI

struct ProjectListView: View {
    
    // Access the shared injected environment data
    @EnvironmentObject var projectManager: ProjectManager
    
    @State private var pickerSelection: String = "Active"
    
    @State private var showAddProjectView: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    Picker(selection: $pickerSelection, label: Text("Picker")) {
                        Text("Inactive")
                            .tag("Inactive")
                        Text("Active")
                            .tag("Active")
                        Text("Completed")
                            .tag("Completed")
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    List {
                        ForEach(projectManager.projects.filter { $0.status == pickerSelection}) { project in
                            withAnimation(.easeInOut) {
                                ProjectCardView(pickerSelection: $pickerSelection, project: project)
                            }
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                    }
                    .scrollContentBackground(.hidden)
                    .listStyle(.plain)
                }
                
                Button {
                    showAddProjectView = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                        .foregroundStyle(.green)
                }
                .padding()
            }
            .navigationTitle("Projects")
            .sheet(isPresented: $showAddProjectView) {
                AddProjectView(pickerSelection: $pickerSelection)
            }
        }
    }
}

#Preview {
    ProjectListView()
        .environmentObject(ProjectManager())
}
