//
//  JobPosting.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-06.
//

import SwiftUI

struct JobPosting: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let company: String
    let industry: String
    let location: String
    let salary: Int
    let responsibilities: String
    let education: String

    func copy() -> JobPosting {
        return JobPosting(
            title: self.title,
            company: self.company,
            industry: self.industry,
            location: self.location,
            salary: self.salary,
            responsibilities: self.responsibilities,
            education: self.education
        )
    }
}
