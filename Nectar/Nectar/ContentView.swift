//
//  ContentView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct ContentView: View {
    @State private var isSignedIn = false // Tracks authentication status
      @State private var showSignUp = false // Toggle for showing sign up screen
      @State private var showSignIn = false // Toggle for showing sign in screen
      @State private var currentUser: User? = nil // Stores the logged-in user
    
    var body: some View {
            HStack {
                VStack(spacing: 30) {
                    Text("Welcome to Nectar")
                        .font(.largeTitle)
                        .padding()
                    
                    Text("A platform for aspiring professionals to find hands-on work opportunities.")
                        .font(.body)
                        .padding()

                    Image(systemName: "app.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding()

                    ButtonView(title: "Sign In") {
                        showSignIn = true
                    }

                    ButtonView(title: "Sign Up") {
                        showSignUp = true
                    }

                    Spacer()
                }
                .padding()
                .background(Gradient(colors: [.yellow, .orangish, .gold]).opacity(0.8))

                VStack {
                    if isSignedIn, let user = currentUser {
                        HomeView(user: user)
                    } else {
                        Text("Please Sign In or Sign Up to continue.")
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .sheet(isPresented: $showSignUp) {
                SignUpView(isSignedIn: $isSignedIn, currentUser: $currentUser)
            }
            .sheet(isPresented: $showSignIn) {
                SignInView(isSignedIn: $isSignedIn, currentUser: $currentUser)
            }
        }
}

// MARK: - HomeView with Top Navigation Tabs
struct HomeView: View {
    let user: User
    
    var body: some View {
        TabView {
            JobListingsView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            JobPostingView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Post Job")
                }
            
            JobDetailsView(currentScreen: .constant("jobDetails"))
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Find Job")
                }
            
            ProfileView(user: user)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            
            SettingsView(currentScreen: .constant("profile"))
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}

// MARK: - Reusable Button Component
struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color.yellow)
                .foregroundColor(.black)
                .cornerRadius(10)
                .shadow(radius: 50)
                .padding(.horizontal, 20)
                .fontWeight(.bold)
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
