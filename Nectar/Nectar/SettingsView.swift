//
//  SettingsView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct SettingsView: View {
    @Binding var currentScreen: String?
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Account").font(.headline).foregroundColor(.gray)) {
                        Button(action: { currentScreen = "profile" }) {
                            SettingsRow(icon: "person.crop.circle", title: "Edit Profile")
                        }
                        Button(action: { print("Change Password tapped") }) {
                            SettingsRow(icon: "key.fill", title: "Change Password")
                        }
                    }
                    
                    Section(header: Text("Preferences").font(.headline).foregroundColor(.gray)) {
                        Button(action: { print("Notifications tapped") }) {
                            SettingsRow(icon: "bell.fill", title: "Notifications")
                        }
                    }
                    
                    Section(header: Text("Account Actions").font(.headline).foregroundColor(.gray)) {
                        Button(action: { print("Log Out tapped") }) {
                            SettingsRow(icon: "arrow.right.square.fill", title: "Log Out", color: .red)
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Settings")
            }
        }
    }
}

struct SettingsRow: View {
    let icon: String
    let title: String
    var color: Color = .primary
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(color)
                .frame(width: 25)
            Text(title)
                .foregroundColor(color)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(currentScreen: .constant("profile"))
    }
}
