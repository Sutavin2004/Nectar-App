//
//  ContentView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct ContentView: View {
    @State private var isSignedIn = false // Tracks if the user is signed in
    @State private var showSignUp = false // Controls the visibility of the sign-up screen
    @State private var showSignIn = false // Controls the visibility of the sign-in screen
    @State private var currentUser: User? = nil // Stores the currently logged-in user
    
    @StateObject private var jobManager = JobManager() // Manages job listings and applications
    
    var body: some View {
        NavigationView {
            if isSignedIn, let user = currentUser {
                // Show the main screen after user signs in
                HomeView(user: user, jobManager: jobManager)
            } else {
                // Show the welcome screen before login
                WelcomeScreen(showSignUp: $showSignUp, showSignIn: $showSignIn)
                    .sheet(isPresented: $showSignUp) {
                        SignUpView(isSignedIn: $isSignedIn, currentUser: $currentUser)
                    }
                    .sheet(isPresented: $showSignIn) {
                        SignInView(isSignedIn: $isSignedIn, currentUser: $currentUser)
                    }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Prevents split-screen issues on iPad
    }
}

// MARK: - Welcome Screen
struct WelcomeScreen: View {
    @Binding var showSignUp: Bool
    @Binding var showSignIn: Bool
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                
                // Logo and App Name
                HStack(spacing: 10) {
                    ZStack {
                        Image(systemName: "hexagon.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color.orangish)
                        
                        Image(systemName: "network")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                            .foregroundColor(.black.opacity(0.6))
                    }
                    
                    Text("nectar")
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
                
                // Tagline
                Text("swipe, match, succeed.")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                // Sign-in and Sign-up Buttons
                VStack(spacing: 15) {
                    ButtonView(title: "sign in", color: .white, textColor: .black) { showSignIn = true }
                    ButtonView(title: "sign up", color: Color.orangish, textColor: .black) { showSignUp = true }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

// MARK: - Home Screen
struct HomeView: View {
    let user: User
    @ObservedObject var jobManager: JobManager
    
    var body: some View {
        TabView {
            // Job Listings Tab
            JobListingsView(jobManager: jobManager)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("home")
                }
                
            // Post Job Tab
            JobPostingView(jobManager: jobManager)
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("post job")
                }
                
            // Find Job Tab
            JobDetailsView(currentScreen: .constant("jobDetails"))
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("find job")
                }
                
            // Profile Tab
            ProfileView(user: user)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("profile")
                }
                
            // Settings Tab
            SettingsView(currentScreen: .constant("profile"))
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("settings")
                }
        }
        .accentColor(.yellow)
    }
}

// MARK: - Reusable Button Component
struct ButtonView: View {
    let title: String
    let color: Color
    let textColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(color)
                .foregroundColor(textColor)
                .cornerRadius(10)
                .shadow(radius: 5)
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
