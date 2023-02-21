//
//  ProgressBar.swift
//  BitMoney
//
//  Created by Hadi Chaaban on 2/21/23.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progress: CGFloat
    private var barColor: Color

    public init(initialProgress: Binding<CGFloat>, color: Color) {
        self._progress = initialProgress
        self.barColor = color
    }

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                // Main Bar
                Rectangle()
                    .fill(barColor.opacity(0.3))
                // Progress Bar
                Rectangle()
                    .fill(barColor)
                    .frame(width: min(geo.size.width, geo.size.width * progress))
                    //.animation(.linear)
            }.cornerRadius(45.0)
        }

    }
}
