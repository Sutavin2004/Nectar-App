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
        VStack {
            Text("User Profile")
                .font(.largeTitle)
                .padding()

            VStack(alignment: .leading, spacing: 15) {
                Text("Name: \(user.name)")
                    .font(.headline)
                Text("Email: \(user.email)")
                    .font(.headline)
                Text("Skills: \(user.skills)")
                    .font(.headline)
                Text("Experience: \(user.experience)")
                    .font(.headline)
            }
            .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("Profile")
    }
}

