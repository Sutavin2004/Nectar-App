//
//  JobDetailsView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct JobDetailsView: View {
    @Binding var currentScreen: String? // Add the binding for currentScreen

    var body: some View {
        VStack {
            Text("Job Details")
                .font(.largeTitle)
                .padding()

            Text("This is a detailed description of the job.")
                .padding()

            // Button to apply for the job
            NavigationLink(destination: JobApplicationConfirmationView(currentScreen: $currentScreen)) {
                Text("Apply for Job")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.yellow, .orangish, .gold]), startPoint: .top, endPoint: .bottom)
                    )
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
        }
        .navigationTitle("Job Details")
    }
}

struct JobDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        JobDetailsView(currentScreen: .constant("jobDetails"))
    }
}
