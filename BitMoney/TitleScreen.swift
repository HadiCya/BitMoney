//
//  TitleScreen.swift
//  BitMoney
//
//  Created by Haris Khan on 2/7/23.
//

import Foundation
import SwiftUI

struct TitleScreen: View {
    //@EnvironmentObject var opData:OpData
    @ObservedObject var gamestate: GameState
    @State private var isActive : Bool = false
    var body: some View {
        //        switch(opData.currView){
        //        case .title:
        //            TitleScreen()
        //                .environmentObject(opData)
        //        case .game:
        //            GameView()
        //                .environmentObject(opData)
        //        case .end:
        //            EndScreen()
        //                .environmentObject(opData)
        //        }
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
                      Button(action: {
                          gamestate.appState = .game
                     }) {Text("Switch View")}
                     
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


struct TitleScreen_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreen(gamestate: GameState(money: 12))
    }
}
