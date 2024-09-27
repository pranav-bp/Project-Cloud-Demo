//
//  NewProjectLinesView.swift
//  GettingStarted
//
//  Created by Pranav Bellam Prasad on 9/27/24.
//

import SwiftUI

struct NewProjectLinesView: View {
    
    @EnvironmentObject var projectManager: ProjectManager
    
    var title : String
    var prompts: [String]
    
    @FocusState private var focusedField: Field?
    
    enum Field: Int, Hashable {
        case field0, field1, field2, field3, field4
    }
    
    var body : some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
//            CustomTextFieldView(placeholder: "Field Professional", text: $fieldProfessional)
                       
        }
        .submitLabel(.next)
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(Color.clear) // Add a background to capture taps
        .onTapGesture {
            focusedField = nil // Dismiss focus when tapping outside
        }
    }
}

#Preview {
    NewProjectLinesView(
        title: "Company Information",
        prompts: ["Company Name", "Street Number", "City, State", "Zipcode", "Country"]
    )
    .environmentObject(ProjectManager())
}
