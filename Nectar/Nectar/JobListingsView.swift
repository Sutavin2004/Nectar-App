//
//  JobListingsView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct Job: Identifiable {
    let id = UUID()
    let title: String
    let company: String
    let location: String
    let salary: String
    let responsibilities: String
    let education: String
}

struct JobListingsView: View {
    @State private var jobs = [
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

    @State private var swipeCount = 0
    @State private var previousJobs: [Job] = []
    let maxFreeSwipes = 15

    var body: some View {
        VStack {
            ZStack {
                if swipeCount < maxFreeSwipes || isPremiumUser() {
                    ForEach(jobs) { job in
                        JobCardView(job: job) { accepted in
                            handleSwipe(job: job, accepted: accepted)
                        }
                    }
                } else {
                    VStack {
                        Text("You've reached your free swipes!")
                            .font(.headline)
                            .foregroundColor(.red)
                            .padding()
                        Button("Upgrade to Premium") {
                            // Handle premium subscription logic
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
            }
            .frame(height: UIScreen.main.bounds.height * 0.75)

            HStack(spacing: 20) {
                Button(action: undoSwipe) {
                    Image(systemName: "arrow.uturn.backward")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                }
                Button(action: { handleSwipe(job: jobs.first, accepted: false) }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                Button(action: { handleSwipe(job: jobs.first, accepted: true) }) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                }
            }
            .padding()
        }
    }

    func handleSwipe(job: Job?, accepted: Bool) {
        guard let job = job else { return }

        withAnimation {
            jobs.removeAll { $0.id == job.id }
            previousJobs.append(job)
            swipeCount += 1
        }

        if accepted {
            submitApplication(for: job)
        }
    }

    func undoSwipe() {
        if let lastJob = previousJobs.popLast() {
            withAnimation {
                jobs.insert(lastJob, at: 0)
                swipeCount -= 1
            }
        }
    }

    func submitApplication(for job: Job) {
        print("Application submitted for \(job.title) at \(job.company)")
        // API call to submit application goes here
    }

    func isPremiumUser() -> Bool {
        return false // Change this based on actual premium status logic
    }
}

struct JobCardView: View {
    let job: Job
    let onSwipe: (Bool) -> Void

    @State private var offset: CGSize = .zero
    @State private var isFlipped = false

    var body: some View {
        ZStack {
            if isFlipped {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .shadow(radius: 5)
                    .frame(height: 500)
                    .overlay(
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Responsibilities")
                                .font(.headline)
                                .bold()
                            Text(job.responsibilities)
                                .font(.body)
                                .padding(.bottom, 5)

                            Text("Education Required")
                                .font(.headline)
                                .bold()
                            Text(job.education)
                                .font(.body)

                            Spacer()
                            Text("Tap to flip back")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding()
                    )
                    .onTapGesture {
                        withAnimation {
                            isFlipped.toggle()
                        }
                    }
            } else {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(UIColor(red: 253/255, green: 218/255, blue: 13/255, alpha: 1)))
                    .shadow(radius: 5)
                    .frame(height: 500)
                    .overlay(
                        VStack(spacing: 10) {
                            Text(job.title)
                                .font(.title)
                                .bold()
                            Text(job.company)
                                .font(.headline)
                                .foregroundColor(.gray)
                            Text(job.location)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(job.salary)
                                .font(.body)
                                .padding(.top, 10)

                            Spacer()
                            Text("Tap for details")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding()
                    )
                    .offset(offset)
                    .rotationEffect(.degrees(Double(offset.width / 10)))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                offset = gesture.translation
                            }
                            .onEnded { _ in
                                if offset.width > 150 {
                                    onSwipe(true) // Accepted
                                } else if offset.width < -150 {
                                    onSwipe(false) // Rejected
                                } else {
                                    offset = .zero // Reset if not swiped far enough
                                }
                            }
                    )
                    .onTapGesture {
                        withAnimation {
                            isFlipped.toggle()
                        }
                    }
            }
        }
        .frame(width: 320, height: 500)
    }
}

struct JobListingsView_Previews: PreviewProvider {
    static var previews: some View {
        JobListingsView()
    }
}
