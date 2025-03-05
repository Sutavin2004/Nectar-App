//
//  SignInView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-05.
//

import SwiftUI

struct SignInView: View {
    @Binding var isSignedIn: Bool
    @Binding var currentUser: User?

    @Environment(\.presentationMode) var presentationMode
    
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""

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
            
            Text("Sign In")
                .font(.largeTitle)
                .padding()

            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            Button("Sign In") {
                if let user = loadUserFromDefaults(), user.email == email, user.password == password {
                    currentUser = user
                    isSignedIn = true
                    presentationMode.wrappedValue.dismiss()
                } else {
                    errorMessage = "Invalid email or password."
                }
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .padding()
    }

    func loadUserFromDefaults() -> User? {
        if let savedData = UserDefaults.standard.data(forKey: "savedUser"),
           let user = try? JSONDecoder().decode(User.self, from: savedData) {
            return user
        }
        return nil
    }
}
