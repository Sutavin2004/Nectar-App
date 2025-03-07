//
//  JobApplicationConfirmationView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct JobApplicationConfirmationView: View {
    @Binding var currentScreen: String? // Controls navigation to job listings
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                // Confirmation Icon
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.gold)
                    
                // Confirmation Message
                Text("application submitted")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    
                Text("thank you for applying to the job! you'll be notified if you're selected.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    
                Spacer()
                
                // Back to Job Listings Button
                Button(action: { currentScreen = "jobListings" }) {
                    Text("back to job listings")
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

struct JobApplicationConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        JobApplicationConfirmationView(currentScreen: .constant("jobListings"))
    }
}
