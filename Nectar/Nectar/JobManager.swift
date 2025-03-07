//
//  JobManager.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-06.
//

import SwiftUI

class JobManager: ObservableObject {
    @Published var jobs: [JobPosting] = [
        JobPosting(title: "software developer", company: "apple", industry: "technology", location: "cupertino, ca", salary: 130000, responsibilities: "develop ios applications, collaborate with teams, write clean code.", education: "bachelor’s in computer science"),
        JobPosting(title: "data analyst", company: "google", industry: "technology", location: "new york, ny", salary: 90000, responsibilities: "analyze datasets, generate reports, optimize business processes.", education: "bachelor’s in statistics"),
        JobPosting(title: "financial analyst", company: "goldman sachs", industry: "finance", location: "new york, ny", salary: 110000, responsibilities: "conduct financial forecasting, prepare reports, assess investment opportunities.", education: "bachelor’s in finance"),
        JobPosting(title: "registered nurse", company: "johns hopkins hospital", industry: "healthcare", location: "baltimore, md", salary: 85000, responsibilities: "provide patient care, administer medications.", education: "bachelor’s in nursing"),
        JobPosting(title: "mechanical engineer", company: "spacex", industry: "engineering", location: "hawthorne, ca", salary: 120000, responsibilities: "design and test aerospace components.", education: "bachelor’s in mechanical engineering")
    ]

    // Returns jobs that match user preferences
    func filteredJobs(industry: String, minSalary: Int, location: String) -> [JobPosting] {
        return jobs.filter { job in
            (industry == "all" || job.industry.lowercased() == industry.lowercased()) &&
            job.salary >= minSalary &&
            (location.isEmpty || job.location.lowercased().contains(location.lowercased()))
        }
    }

    // Adds a new job posting to the list
    func addJob(_ job: JobPosting) {
        jobs.append(job)
    }
}
