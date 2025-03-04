//
//  ProfileView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct ProfileView: View {
    

    // Sample profile data
    @State private var name = "John Doe"
    @State private var email = "john.doe@example.com"
    @State private var skills = ["Swift", "UI Design", "GitHub", "Project Management"]
    @State private var experience = "2 years"

    var body: some View {
        VStack {
            // Profile Header
            Text("User Profile")
                .font(.largeTitle)
                .padding()

            // Profile Info Section
            VStack(alignment: .leading, spacing: 15) {
                Text("Name: \(name)")
                    .font(.headline)
                Text("Email: \(email)")
                    .font(.headline)
                Text("Skills: \(skills.joined(separator: ", "))")
                    .font(.headline)
                Text("Experience: \(experience)")
                    .font(.headline)
            }
            .padding()

            
            .padding()

            Spacer()

            // Back Button to go back to Home
            
        }
        .padding()
        .navigationTitle("Profile") // Add title for navigation bar
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
