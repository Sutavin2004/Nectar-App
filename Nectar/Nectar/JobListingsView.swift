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
    @ObservedObject var jobManager: JobManager

    @State private var swipeCount = 0
    @State private var previousJobs: [Job] = []
    let maxFreeSwipes = 15
    
    @State private var showJobPosting = false

    var body: some View {
        VStack {
            ZStack {
                if swipeCount < maxFreeSwipes || isPremiumUser() {
                    ForEach(jobManager.jobs) { job in
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
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.yellow, .orangish, .gold]), startPoint: .top, endPoint: .bottom)
                        )
                        .foregroundColor(.black)
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
                Button(action: { handleSwipe(job: jobManager.jobs.first, accepted: false) }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                Button(action: { handleSwipe(job: jobManager.jobs.first, accepted: true) }) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                }
            }
            .padding()
        }
        .sheet(isPresented: $showJobPosting) {
            JobPostingView(jobManager: jobManager)
        }
    }

    func handleSwipe(job: Job?, accepted: Bool) {
        guard let job = job else { return }

        withAnimation {
            jobManager.jobs.removeAll { $0.id == job.id }
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
                jobManager.jobs.insert(lastJob, at: 0)
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
