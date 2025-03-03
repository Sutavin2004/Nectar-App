//
//  SettingsView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct SettingsView: View {
    @Binding var currentScreen: String?

    var body: some View {
        VStack {
            // Settings Screen Title
            Text("Settings")
                .font(.largeTitle)
                .padding()

            // List of settings options
            List {
                Button("Edit Profile") {
                    // Navigate to Profile screen
                    currentScreen = "profile" // Go to the Profile screen
                }
                Button("Change Password") {
                    // Placeholder for Change Password functionality
                    print("Change Password tapped")
                }
                Button("Notifications") {
                    // Placeholder for Notifications functionality
                    print("Notifications tapped")
                }
                Button("Log Out") {
                    // Placeholder for Log Out functionality
                    print("Log Out tapped")
                }
            }
            .padding()

            Spacer()

            // Back Button to go back to Profile
            Button("Back to Profile") {
                currentScreen = "profile" // Go back to the Profile screen
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(currentScreen: .constant("profile"))
    }
}
