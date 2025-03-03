//
//  ContentView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct ContentView: View {
    @State private var currentScreen: String? = nil // Track the current screen

    var body: some View {
        HStack {
            // Left side: Buttons for navigation
            VStack(spacing: 30) {
                // Home Screen title and description
                Text("Welcome to Nectar")
                    .font(.largeTitle)
                    .padding()

                Text("A platform for aspiring professionals to find hands-on work opportunities.")
                    .font(.body)
                    .padding()

                // Add an image or icon for the app (Optional)
                Image(systemName: "app.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()

                // Button to navigate to Job Listings
                Button(action: {
                    currentScreen = "jobListings"
                }) {
                    Text("Go to Job Listings")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.title2)
                }

                // Button to navigate to Profile
                Button(action: {
                    currentScreen = "profile"
                }) {
                    Text("Go to Profile")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.title2)
                }

                // Button to navigate to Job Posting
                Button(action: {
                    currentScreen = "jobPosting"
                }) {
                    Text("Go to Job Posting")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.title2)
                }

                Spacer() // To ensure buttons stay at the top
            }
            .padding()

            // Right side: Content that changes based on button press
            VStack {
                if currentScreen == "jobListings" {
                    JobListingsView(currentScreen: $currentScreen)
                } else if currentScreen == "profile" {
                    ProfileView(currentScreen: $currentScreen)
                } else if currentScreen == "jobPosting" {
                    JobPostingView(currentScreen: $currentScreen)
                } else {
                    Text("Select a screen to navigate.")
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity) // Ensures the content takes the rest of the screen width
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
