//
//  LogPage.swift
//  BitMoney
//
//  Created by Haris Khan on 2/17/23.
//

import SwiftUI

struct LogScreen: View {
    @ObservedObject var gamestate: GameState
    @ObservedObject var soundplayer: MusicPlayer
    var body: some View {
        GeometryReader { geo in
            ZStack (alignment: .top){
                Image("Background")
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .opacity(1.0)
                VStack {
                    Text("Log")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("PressStartK", size: 300))
                        .foregroundColor(.black)
                        .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.06)
                        .minimumScaleFactor(0.01)
                    Image("Line")
                        .resizable()
                        .scaledToFit()
                    ScrollView{
                        ForEach(gamestate.history, id: \.0) { days in
                            Image("Smallpopup")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.9)
                                .overlay(
                                    VStack{
                                        HStack{
                                            Text("Day \(days.0)")
                                                .multilineTextAlignment(.center)
                                                .font(Font.custom("PressStartK", size: 300))
                                                .foregroundColor(.black)
                                                .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.055)
                                                .minimumScaleFactor(0.01)
                                                .padding(geo.size.width * 0.05)
                                        }
                                        Text("\(days.1)\n\(days.2)\n\(days.3)")
                                            .multilineTextAlignment(.center)
                                            .font(Font.custom("PressStartK", size: 300))
                                            .foregroundColor(.black)
                                            .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.10)
                                            .minimumScaleFactor(0.01)
                                            .padding(geo.size.width * 0.05)
                                        Spacer()
                                    }
                                    
                                )
                        }
                    }
                        Button(action: {
                            gamestate.appState = .end
                            HapticManager.instance.impact(style: .light)
                            soundplayer.startSoundEffect(sound: "PluckSound")
                        })
                        {
                            Image("BlankButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.9)
                            
                                .overlay(
                                    Text("Back")
                                        .multilineTextAlignment(.center)
                                        .font(Font.custom("PressStartK", size: 300))
                                        .foregroundColor(.black)
                                        .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.05)
                                        .minimumScaleFactor(0.01)
                                        .padding(geo.size.width * 0.05)
                                )
                        }
                }
            }
        }
        
    }
}
