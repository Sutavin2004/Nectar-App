//
//  JobPostingView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct JobPostingView: View {
    @ObservedObject var jobManager: JobManager

    @State private var jobTitle = ""
    @State private var companyName = ""
    @State private var location = ""
    @State private var salary = ""
    @State private var responsibilities = ""
    @State private var education = ""

    @State private var showConfirmation = false // ✅ New state to show confirmation

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Text("Post a Job")
                    .font(.largeTitle)
                    .padding()

                TextField("Job Title", text: $jobTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Company Name", text: $companyName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Location", text: $location)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Salary", text: $salary)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Responsibilities", text: $responsibilities)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Education Requirements", text: $education)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: postJob) {
                    Text("Post Job")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.yellow, .orangish, .gold]), startPoint: .top, endPoint: .bottom)
                        )
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                .padding()

                if showConfirmation { // ✅ Show confirmation message when job is posted
                    Text("Job Posted Successfully!")
                        .foregroundColor(.green)
                        .font(.headline)
                        .padding()
                }

                Spacer()
            }
            .padding()
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }

    // ✅ Function to Post a Job
    func postJob() {
        let newJob = Job(
            title: jobTitle,
            company: companyName,
            location: location,
            salary: salary,
            responsibilities: responsibilities,
            education: education
        )

        jobManager.addJob(newJob)

        // ✅ Clear input fields
        jobTitle = ""
        companyName = ""
        location = ""
        salary = ""
        responsibilities = ""
        education = ""

        // ✅ Show confirmation message
        showConfirmation = true

        // ✅ Hide the confirmation message after 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showConfirmation = false
        }
    }
}
