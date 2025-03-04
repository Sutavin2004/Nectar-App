//
//  JobListingsView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct JobListingsView: View {
    

    var body: some View {
        VStack {
            Text("Job Listings")
                .font(.largeTitle)
                .padding()

            // Placeholder job listings
            List {
                Text("Job 1: Software Developer")
                Text("Job 2: Data Analyst")
                Text("Job 3: Graphic Designer")
            }

            
        }
        .padding()
    }
}

struct JobListingsView_Previews: PreviewProvider {
    static var previews: some View {
        JobListingsView()
    }
}
