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
        NavigationView {
            if isSignedIn, let user = currentUser {
                // ✅ Show main screen after signing in
                HomeView(user: user)
            } else {
                // ✅ Show Welcome Screen before login
                WelcomeScreen(showSignUp: $showSignUp, showSignIn: $showSignIn)
                    .sheet(isPresented: $showSignUp) {
                        SignUpView(isSignedIn: $isSignedIn, currentUser: $currentUser)
                    }
                    .sheet(isPresented: $showSignIn) {
                        SignInView(isSignedIn: $isSignedIn, currentUser: $currentUser)
                    }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // ✅ Prevents unwanted split-screen effects on iPad
    }
}

// MARK: - Welcome Screen (Fixes Split-Screen Issue)
struct WelcomeScreen: View {
    @Binding var showSignUp: Bool
    @Binding var showSignIn: Bool

    var body: some View {
        ZStack {
            // ✅ Background gradient wrapped in Color
            LinearGradient(gradient: Gradient(colors: [.yellow, .orangish, .gold]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea() // ✅ Correct way to extend background

            VStack(spacing: 30) {
                Spacer()
                
                Text("Welcome to Nectar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .multilineTextAlignment(.center)
                
                Text("A platform for aspiring professionals to find hands-on work opportunities.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Image(systemName: "app.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()

                ButtonView(title: "Sign In", action: { showSignIn = true })
                ButtonView(title: "Sign Up", action: { showSignUp = true })
                
                Spacer()
            }
            .padding()
        }
    }
}


// MARK: - Home Screen (After Sign In)
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
