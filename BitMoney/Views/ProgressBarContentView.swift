//
//  ProgressBarContentView.swift
//  BitMoney
//
//  Created by Hadi Chaaban on 2/21/23.
//

import SwiftUI

struct ProgressBarContentView: View {
@State var progress: CGFloat = 0.0
var body: some View {
    VStack {
        ProgressBar(initialProgress: $progress, color: .green)
            .frame(height: 20)
            .padding()
        Button(action: { self.start() }) {
            Text("Start")
        }
    }
}
func start() {
    Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) {
        timer in
        self.progress += 0.1
    }
}
}
