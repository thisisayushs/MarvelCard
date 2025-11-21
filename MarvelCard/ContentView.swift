//
//  ContentView.swift
//  MarvelCard
//
//  Created by Ayush Kumar Singh on 10/15/24.
//

import SwiftUI
import CoreMotion
import Combine

final class MotionManager: ObservableObject {
    private let manager = CMMotionManager()
    @Published var roll: Double = 0
    @Published var pitch: Double = 0
    
    func start() {
        guard manager.isDeviceMotionAvailable else { return }
        manager.deviceMotionUpdateInterval = 1.0 / 60.0
        manager.startDeviceMotionUpdates(to: .main) { [weak self] motion, _ in
            guard let motion = motion else { return }
            // Limit extremes and smooth a bit
            let maxTilt: Double = .pi / 6 // 30 degrees clamp
            self?.roll = max(-maxTilt, min(maxTilt, motion.attitude.roll))
            self?.pitch = max(-maxTilt, min(maxTilt, motion.attitude.pitch))
        }
    }
    
    func stop() {
        manager.stopDeviceMotionUpdates()
    }
}

struct ContentView: View {
    @State private var showingBack = false
    @StateObject private var motion = MotionManager()
    
    var body: some View {
        let tiltAmount: Double = 12 // max visual tilt in degrees
        let xTilt = -motion.pitch / (.pi / 2) * tiltAmount
        let yTilt = motion.roll / (.pi / 2) * tiltAmount
        
        return ZStack {
            FrontView()
                .opacity(showingBack ? 0.0 : 1.0)
                .rotation3DEffect(.degrees(showingBack ? 180 : 0), axis: (x: 0, y: 1, z: 0), perspective: 0.6)
            
            BackView()
                .opacity(showingBack ? 1.0 : 0.0)
                .rotation3DEffect(.degrees(showingBack ? 0 : -180), axis: (x: 0, y: 1, z: 0), perspective: 0.6)
        }
        .rotation3DEffect(.degrees(xTilt), axis: (x: 1, y: 0, z: 0))
        .rotation3DEffect(.degrees(yTilt), axis: (x: 0, y: 1, z: 0))
        .animation(.easeInOut(duration: 0.5), value: showingBack)
        .onTapGesture {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            showingBack.toggle()
        }
        .onAppear { motion.start() }
        .onDisappear { motion.stop() }
        .statusBar(hidden: true)
    }
        
}

#Preview {
    ContentView()
        .preferredColorScheme(.light)
}
