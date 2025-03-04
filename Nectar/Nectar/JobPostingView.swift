//
//  JobPostingView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct JobPostingView: View {
    

    @State private var jobTitle = ""
    @State private var jobDescription = ""

    var body: some View {
        VStack {
            Text("Post a Job")
                .font(.largeTitle)
                .padding()

            TextField("Job Title", text: $jobTitle)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Job Description", text: $jobDescription)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Post Job") {
                // Code to post the job can go here
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            
        }
        .padding()
    }
}

struct JobPostingView_Previews: PreviewProvider {
    static var previews: some View {
        JobPostingView()
    }
}
