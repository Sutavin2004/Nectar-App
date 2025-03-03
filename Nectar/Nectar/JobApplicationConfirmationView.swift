//
//  JobApplicationConfirmationView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct JobApplicationConfirmationView: View {
    @Binding var currentScreen: String? // Add the binding for currentScreen

    var body: some View {
        VStack {
            Text("Application Submitted")
                .font(.largeTitle)
                .padding()

            Text("Thank you for applying to the job!")
                .padding()

            // Button to go back to the Job Listings
            Button("Back to Job Listings") {
                currentScreen = "jobListings" // Navigate back to Job Listings
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .navigationTitle("Application Confirmation")
    }
}

struct JobApplicationConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        JobApplicationConfirmationView(currentScreen: .constant("jobListings"))
    }
}

