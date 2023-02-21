//
//  SettingsPage.swift
//  BitMoney
//
//  Created by Haris Khan on 2/17/23.
//

import SwiftUI

struct SettingsScreen: View {
    @ObservedObject var gamestate: GameState
    @ObservedObject var musicplayer: MusicPlayer
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
                    Text("Settings")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("PressStartK", size: 300))
                         .foregroundColor(.black)
                         .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.12)
                         .minimumScaleFactor(0.01)
                         .padding(geo.size.width * 0.05)
                    Button(action: {
                        musicplayer.music = !musicplayer.music
                        HapticManager.instance.impact(style: .light)
                        soundplayer.startSoundEffect(sound: "PluckSound")
                    })
                    {
                        Image("BlankButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.9)
                            
                            .overlay(
                                Text("Music: \(onOff(music: musicplayer.music))" as String)
                                    .multilineTextAlignment(.center)
                                    .font(Font.custom("PressStartK", size: 300))
                                     .foregroundColor(.black)
                                     .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.05)
                                     .minimumScaleFactor(0.01)
                                     .padding(geo.size.width * 0.05)
                            )
                    }
                            Button(action: {
                                gamestate.appState = .title
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

func onOff(music: Bool) -> String{
    if music {
        return "On"
    }
    return "Off"
}

