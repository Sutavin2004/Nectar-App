//
//  ContentView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                Text("Nectar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.black)

                
                NavigationLink(destination: HomeView()) {
                    ButtonView(title: "Sign In")
                }
               
                NavigationLink(destination: HomeView()) {
                    ButtonView(title: "Sign Up")
                }
                
                Spacer()
            }
            
            .padding()
            .navigationTitle("")
            .containerRelativeFrame([.horizontal, .vertical])
            .background(Gradient(colors: [.yellow, .orangish, .gold]).opacity(0.8))
        }
        
    }
}

struct HomeView: View {
    @State private var currentScreen: String?  // Track the current screen

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
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            
        }
        
    }
}

struct ButtonView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity)
            .padding(.vertical,20)
            .background(Color.yellow)
            .foregroundColor(.black)
            .cornerRadius(10)
            .shadow(radius: 50)
            .padding(.horizontal, 20)
            .fontWeight(.bold)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
