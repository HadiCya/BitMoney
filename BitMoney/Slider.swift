//
//  Slider.swift
//  BitMoney
//
//  Created by Haris Khan on 2/9/23.
//

import Foundation
import SwiftUI

struct SliderView1: View {
    @Binding var value: Double
    
    @State var lastCoordinateValue: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            let minValue = 0.0
            let maxValue = geo.size.width * 0.85
            
            
            
            ZStack {
                Image("LineWithArrows")
                    .resizable()
                    .scaledToFit()
                    HStack {
                        Image("SliderButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.15)
                            .offset(x: self.value)
                            .gesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged { v in
                                        if (abs(v.translation.width) < 0.1) {
                                            self.lastCoordinateValue = self.value
                                        }
                                        if v.translation.width > 0 {
                                            self.value = min(maxValue, self.lastCoordinateValue + v.translation.width)
                                        } else {
                                            self.value = max(minValue, self.lastCoordinateValue + v.translation.width)
                                        }
                                        
                                    }
                            )
                        Spacer()
                    }
                }
            }
        }
    }
