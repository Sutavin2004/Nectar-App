//
//  JobPostingView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-06.
//

import SwiftUI

struct JobPostingView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var jobManager: JobManager
    
    @State private var title = ""
    @State private var company = ""
    @State private var industry = "technology"
    @State private var location = ""
    @State private var salary: Double = 50000
    @State private var responsibilities = ""
    @State private var education = ""

    private let industries = ["technology", "finance", "healthcare", "engineering", "marketing", "education", "legal"]

    var body: some View {
        NavigationView {
            VStack {
                Text("post a job")
                    .font(.largeTitle)
                    .foregroundColor(.gold)
                
                TextField("job title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("company", text: $company)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Picker("industry", selection: $industry) {
                    ForEach(industries, id: \.self) { industry in
                        Text(industry.capitalized)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()

                TextField("location", text: $location)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                HStack {
                    Text("salary: $\(Int(salary))")
                        .foregroundColor(.gold)
                    Spacer()
                }
                .padding()

                Slider(value: $salary, in: 30000...200000, step: 5000)
                    .accentColor(.gold)
                    .padding()

                TextField("responsibilities", text: $responsibilities)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("education required", text: $education)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("post job") {
                    let newJob = JobPosting(
                        title: title,
                        company: company,
                        industry: industry,
                        location: location,
                        salary: Int(salary),
                        responsibilities: responsibilities,
                        education: education
                    )
                    jobManager.addJob(newJob)
                    dismiss()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gold)
                .foregroundColor(.black)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal, 20)

                Spacer()
            }
            .padding()
        }
    }
}
