//
//  TitleScreen.swift
//  BitMoney
//
//  Created by Haris Khan on 2/7/23.
//

import Foundation
import SwiftUI

struct TitleScreen: View {

    @ObservedObject var gamestate: GameState
    @ObservedObject var soundplayer: MusicPlayer
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
                        .font(Font.custom("PressStartK", size: 300))
                        .foregroundColor(.black)
                        .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.1)
                        .minimumScaleFactor(0.01)
                    Button(action: {
                        gamestate.appState = .difficulty
                        HapticManager.instance.impact(style: .light)
                        soundplayer.startSoundEffect(sound: "PluckSound")
                    })
                    {
                        Image("BlankButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.9)
                            .overlay(
                                Text("Start")
                                    .font(Font.custom("PressStartK", size: 300))
                                    .foregroundColor(.black)
                                    .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.05)
                                    .minimumScaleFactor(0.01)
                            )
                    }
                    Button(action: {
                        resume(gamestate: gamestate)
                        HapticManager.instance.impact(style: .light)
                        soundplayer.startSoundEffect(sound: "PluckSound")
                    })
                    {
                        Image("BlankButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.9)
                            .overlay(
                                Text("Resume")
                                    .font(Font.custom("PressStartK", size: 300))
                                    .foregroundColor(.black)
                                    .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.05)
                                    .minimumScaleFactor(0.01)
                            )
                        
                    }
                    Button(action: {
                        gamestate.appState = .settings
                        HapticManager.instance.impact(style: .light)
                        soundplayer.startSoundEffect(sound: "PluckSound")
                    })
                    {
                        Image("BlankButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.9)
                            .overlay(
                                Text("Settings")
                                    .font(Font.custom("PressStartK", size: 300))
                                    .foregroundColor(.black)
                                    .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.05)
                                    .minimumScaleFactor(0.01)
                            )
                    }
                    //IF GAME CENTER IS LOGGED IN:
                    if gamestate.gameCenterUser{
                        Button(action: {
                            gamestate.loadLeaderboard()
                            HapticManager.instance.impact(style: .heavy)
                            soundplayer.startSoundEffect(sound: "PluckSound")
                        })
                        {
                            Image("BlankButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.9)
                                .overlay(
                                    Text("Leaderboard")
                                        .font(Font.custom("PressStartK", size: 300))
                                        .foregroundColor(.black)
                                        .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.05)
                                        .minimumScaleFactor(0.01)
                                )
                        }
                    }
                    //END
                    
                }
            }
            
        }
    }
}

func resume(gamestate: GameState){
    if gamestate.currGame {
        gamestate.appState = .game
    } else {
        gamestate.appState = .difficulty
    }
}


