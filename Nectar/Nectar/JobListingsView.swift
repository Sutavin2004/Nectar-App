//
//  JobListingsView.swift
//  Nectar
//
//  Created by Sutavin Vinothan on 2025-03-02.
//

import SwiftUI

struct JobListingsView: View {
    @ObservedObject var jobManager: JobManager

    @State private var swipeCount = 0
    @State private var previousJobs: [JobPosting] = []
    let maxFreeSwipes = 15

    @State private var showJobPosting = false
    @State private var showPreferences = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack {
                HStack {
                    Button(action: { showPreferences.toggle() }) {
                        Image(systemName: "slider.horizontal.3")
                            .font(.title)
                            .foregroundColor(.gold)
                    }
                    
                    Spacer()
                    
                    Text("\(jobManager.jobs.count) jobs available")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: { showJobPosting.toggle() }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.orangish)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)

                Divider().background(Color.white.opacity(0.2))

                ZStack {
                    ForEach(jobManager.jobs) { job in
                        JobCardView(job: .constant(job)) { accepted in
                            handleSwipe(job: job, accepted: accepted)
                        }
                    }
                }
                .frame(height: UIScreen.main.bounds.height * 0.7)

                HStack(spacing: 40) {
                    Button(action: undoSwipe) {
                        Image(systemName: "arrow.uturn.backward.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(previousJobs.isEmpty ? .gray : .gold)
                            .opacity(previousJobs.isEmpty ? 0.5 : 1.0)
                    }
                    .disabled(previousJobs.isEmpty)

                    Button(action: { handleSwipe(job: jobManager.jobs.first, accepted: false) }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.red)
                    }

                    Button(action: { handleSwipe(job: jobManager.jobs.first, accepted: true) }) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.green)
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .sheet(isPresented: $showJobPosting) {
            JobPostingView(jobManager: jobManager)
        }
        .sheet(isPresented: $showPreferences) {
            JobPreferencesView()
        }
    }

    func handleSwipe(job: JobPosting?, accepted: Bool) {
        guard let job = job else { return }
        
        withAnimation {
            jobManager.jobs.removeAll { $0.id == job.id }
            previousJobs.append(job.copy())
            swipeCount += 1
        }
    }

    func undoSwipe() {
        if let lastJob = previousJobs.popLast() {
            withAnimation {
                jobManager.jobs.insert(lastJob.copy(), at: 0)
                swipeCount -= 1
            }
        }
    }
}

// MARK: - Job Card View
struct JobCardView: View {
    @Binding var job: JobPosting
    let onSwipe: (Bool) -> Void

    @State private var offset: CGSize = .zero
    @State private var isFlipped = false

    var body: some View {
        ZStack {
            if isFlipped {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black.opacity(0.9))
                    .shadow(radius: 10)
                    .frame(width: 350, height: 550)
                    .overlay(
                        VStack(alignment: .leading, spacing: 15) {
                            Text("responsibilities")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundColor(.gold)
                            Text(job.responsibilities)
                                .font(.system(size: 16, design: .rounded))
                                .foregroundColor(.white)

                            Text("education required")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundColor(.gold)
                            Text(job.education)
                                .font(.system(size: 16, design: .rounded))
                                .foregroundColor(.white)

                            Spacer()
                            Text("tap to flip back")
                                .font(.system(size: 14, design: .rounded))
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
                RoundedRectangle(cornerRadius: 20)
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.gold, Color.orangish]),
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    ))
                    .shadow(radius: 10)
                    .frame(width: 350, height: 550)
                    .overlay(
                        VStack(spacing: 15) {
                            Text(job.title)
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundColor(.black)

                            Text(job.company)
                                .font(.system(size: 22, design: .rounded))
                                .foregroundColor(.white)

                            Text(job.location)
                                .font(.system(size: 18, design: .rounded))
                                .foregroundColor(.gray)

                            Divider().background(Color.white)

                            Text("$\(job.salary)") // Fixed Int to String conversion
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.black)

                            Spacer()
                            Text("tap for details")
                                .font(.system(size: 14, design: .rounded))
                                .foregroundColor(.gray)
                        }
                        .padding()
                    )
            }
        }
        .frame(width: 350, height: 550)
        .shadow(radius: 8)
    }
}

// MARK: - PreviewProvider
struct JobListingsView_Previews: PreviewProvider {
    static var previews: some View {
        JobListingsView(jobManager: JobManager()) // Uses a sample JobManager instance
    }
}
