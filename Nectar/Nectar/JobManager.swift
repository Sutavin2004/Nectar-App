//
//  JobManager.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-06.
//

import SwiftUI

class JobManager: ObservableObject {
    @Published var jobs: [Job] = [
        Job(title: "Software Developer", company: "Apple", location: "Cupertino, CA", salary: "$120k - $150k", responsibilities: "Develop iOS applications, collaborate with cross-functional teams, write clean and scalable code.", education: "Bachelor’s in Computer Science or equivalent experience"),
        Job(title: "Data Analyst", company: "Google", location: "New York, NY", salary: "$80k - $110k", responsibilities: "Analyze large datasets, generate reports, optimize business processes.", education: "Bachelor’s in Statistics, Mathematics, or related field"),
        Job(title: "UI/UX Designer", company: "Meta", location: "San Francisco, CA", salary: "$90k - $130k", responsibilities: "Design intuitive interfaces, conduct user research, collaborate with developers.", education: "Bachelor’s in Design, Human-Computer Interaction, or similar"),
        Job(title: "Product Manager", company: "Tesla", location: "Austin, TX", salary: "$110k - $140k", responsibilities: "Define product vision, manage development cycles, coordinate with stakeholders.", education: "Bachelor’s in Business, Engineering, or related field"),
        Job(title: "Cybersecurity Analyst", company: "Microsoft", location: "Redmond, WA", salary: "$95k - $125k", responsibilities: "Monitor security threats, implement cybersecurity protocols, conduct risk assessments.", education: "Bachelor’s in Cybersecurity, Computer Science, or related field"),
        Job(title: "Marketing Coordinator", company: "Amazon", location: "Seattle, WA", salary: "$65k - $85k", responsibilities: "Develop marketing strategies, manage campaigns, analyze market trends.", education: "Bachelor’s in Marketing, Communications, or related field"),
        Job(title: "Mechanical Engineer", company: "SpaceX", location: "Hawthorne, CA", salary: "$100k - $135k", responsibilities: "Design and test aerospace components, collaborate with engineers, improve manufacturing processes.", education: "Bachelor’s in Mechanical Engineering or equivalent"),
        Job(title: "Financial Analyst", company: "Goldman Sachs", location: "New York, NY", salary: "$90k - $120k", responsibilities: "Conduct financial forecasting, prepare reports, assess investment opportunities.", education: "Bachelor’s in Finance, Accounting, or related field"),
        Job(title: "Software Developer", company: "Netflix", location: "Los Gatos, CA", salary: "$130k - $160k", responsibilities: "Develop high-performance applications, optimize video streaming algorithms, collaborate with engineers.", education: "Bachelor’s in Computer Science or equivalent experience"),
        Job(title: "Graphic Designer", company: "Adobe", location: "San Jose, CA", salary: "$75k - $100k", responsibilities: "Create visual designs, collaborate with marketing teams, develop brand guidelines.", education: "Bachelor’s in Graphic Design, Visual Arts, or related field")
    ]
    
    // ✅ Function to Add a New Job
    func addJob(_ job: Job) {
        jobs.append(job)
    }
}
