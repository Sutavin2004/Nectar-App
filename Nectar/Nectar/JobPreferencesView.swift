//
//  JobPreferencesView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-06.
//

import SwiftUI

struct JobPreferencesView: View {
    @Environment(\.dismiss) var dismiss

    // Persist preferences across app sessions
    @AppStorage("preferredIndustry") private var preferredIndustry: String = "all"
    @AppStorage("preferredMinSalary") private var preferredMinSalary: Int = 50000
    @AppStorage("preferredLocation") private var preferredLocation: String = ""

    private let industries = ["all", "technology", "finance", "healthcare", "engineering", "marketing", "education", "legal"]

    var body: some View {
        NavigationView {
            VStack {
                Text("job preferences")
                    .font(.largeTitle)
                    .foregroundColor(.gold)
                
                // Industry Selection
                Picker("industry", selection: $preferredIndustry) {
                    ForEach(industries, id: \.self) { industry in
                        Text(industry.capitalized)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()

                // Minimum Salary Selection
                HStack {
                    Text("minimum salary:")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("$\(preferredMinSalary)")
                        .foregroundColor(.gold)
                }
                .padding()
                
                Slider(value: Binding(get: {
                    Double(preferredMinSalary)
                }, set: { newValue in
                    preferredMinSalary = Int(newValue)
                }), in: 30000...200000, step: 5000)
                .accentColor(.gold)
                .padding()

                // Location Input
                TextField("preferred location", text: $preferredLocation)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Spacer()

                // Save Preferences Button
                Button("save preferences") {
                    dismiss()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gold)
                .foregroundColor(.black)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal, 20)
            }
            .padding()
        }
    }
}
