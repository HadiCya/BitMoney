//
//  TitleScreen.swift
//  BitMoney
//
//  Created by Haris Khan on 2/7/23.
//

import Foundation
import SwiftUI

struct TitleScreen: View {
@State private var isActive : Bool = false
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Image("Background")
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .opacity(1.0)
                VStack{
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .padding(geo.size.width * 0.07)
                    Text("BitMoney")
                        .font(Font.custom("PressStartK", size: geo.size.width * 0.12))
                        .padding(geo.size.width * 0.02)
                        .foregroundColor(.black)
                    Image("BlankButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.9)
                        .overlay(
                            Text("Start")
                                .font(Font.custom("PressStartK", size: geo.size.width * 0.08))
                                .foregroundColor(.black)
                                .padding(geo.size.width * 0.04)
                        )
                    Image("BlankButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.9)
                        .overlay(
                            Text("Resume")
                                .font(Font.custom("PressStartK", size: geo.size.width * 0.08))
                                .foregroundColor(.black)
                                .padding(geo.size.width * 0.04)
                        )
                    Image("BlankButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.9)
                        .overlay(
                            Text("Settings")
                                .font(Font.custom("PressStartK", size: geo.size.width * 0.08))
                                .foregroundColor(.black)
                                .padding(geo.size.width * 0.04)
                        )
                }
            }
        }
    }
}
struct ConentView_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreen()
    }
}
