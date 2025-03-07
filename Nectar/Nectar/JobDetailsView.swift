//
//  JobDetailsView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct JobDetailsView: View {
    @Binding var currentScreen: String? // Controls navigation flow
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                // Header
                Text("job details")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    
                Text("this is a detailed description of the job, including responsibilities, requirements, and company information.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    
                // Job Information Box
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 350, height: 200)
                    .overlay(
                        VStack(alignment: .leading, spacing: 10) {
                            Text("position: software engineer")
                                .font(.headline)
                                .foregroundColor(.gold)
                            Text("company: tech corp")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            Text("location: san francisco, ca")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            Text("salary: $120k - $140k per year")
                                .font(.subheadline)
                                .foregroundColor(.orangish)
                        }
                        .padding()
                    )
                    .padding()
                
                Spacer()
                
                // Apply Button
                NavigationLink(destination: JobApplicationConfirmationView(currentScreen: $currentScreen)) {
                    Text("apply for job")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(Color.orangish)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal, 20)
                        .fontWeight(.bold)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct JobDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        JobDetailsView(currentScreen: .constant("jobDetails"))
    }
}

