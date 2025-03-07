//
//  ProfileView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack {
                // Profile Picture
                ZStack {
                    Circle()
                        .fill(Color(UIColor(red: 253/255, green: 218/255, blue: 13/255, alpha: 1)))
                        .frame(width: 120, height: 120)
                        .shadow(radius: 5)
                    
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 110)
                        .foregroundColor(.white)
                }
                .padding(.top, 40)
                
                Text(user.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Divider()
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("Skills")
                            .font(.headline)
                    }
                    Text(user.skills)
                        .font(.body)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Image(systemName: "briefcase.fill")
                            .foregroundColor(.blue)
                        Text("Experience")
                            .font(.headline)
                    }
                    Text(user.experience)
                        .font(.body)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 30)
                .padding(.top, 10)
                
                Spacer()
            }
        }
        .navigationTitle("Profile")
    }
}
