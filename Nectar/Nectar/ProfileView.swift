//
//  ProfileView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct ProfileView: View {
    @Binding var currentScreen: String?

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

            // Navigate to Settings
            Button(action: {
                currentScreen = "settings" // Navigate to Settings screen
            }) {
                Text("Go to Settings")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.title2)
            }
            .padding()

            Spacer()

            // Back Button to go back to Home
            Button("Back to Home") {
                currentScreen = nil // Go back to the Home screen
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .navigationTitle("Profile") // Add title for navigation bar
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(currentScreen: .constant("profile"))
    }
}
