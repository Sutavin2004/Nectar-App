//
//  SignUpView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-05.
//

import SwiftUI

struct SignUpView: View {
    @Binding var isSignedIn: Bool
    @Binding var currentUser: User?
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var skills = ""
    @State private var experience = ""

    var body: some View {
        VStack {
            // Top Bar with X Button
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.gray)
                }
                .padding()
            }

            Text("Sign Up")
                .font(.largeTitle)
                .padding()

            TextField("Name", text: $name)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Skills (comma separated)", text: $skills)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Experience (e.g., 2 years)", text: $experience)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Create Account") {
                let newUser = User(name: name, email: email, password: password, skills: skills, experience: experience)
                saveUserToDefaults(user: newUser)
                currentUser = newUser
                isSignedIn = true
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .padding()
    }
    
    func saveUserToDefaults(user: User) {
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: "savedUser")
        }
    }
}
