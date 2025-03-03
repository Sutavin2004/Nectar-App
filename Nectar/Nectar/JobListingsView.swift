//
//  JobListingsView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct JobListingsView: View {
    @Binding var currentScreen: String?

    var body: some View {
        VStack {
            Text("Job Listings")
                .font(.largeTitle)
                .padding()

            // Placeholder job listings
            List {
                Text("Job 1: Software Developer")
                Text("Job 2: Data Analyst")
                Text("Job 3: Graphic Designer")
            }

            Button("Back to Home") {
                currentScreen = nil // Go back to the Home screen
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

struct JobListingsView_Previews: PreviewProvider {
    static var previews: some View {
        JobListingsView(currentScreen: .constant("jobListings"))
    }
}
