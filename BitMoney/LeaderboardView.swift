//
//  LeaderboardPage.swift
//  BitMoney
//
//  Created by Haris Khan on 2/17/23.
//

import SwiftUI

struct LeaderboardView: View {
    @ObservedObject var gamestate: GameState
    var body: some View {
        GeometryReader { geo in
            ScrollView{
                ZStack (alignment: .top){
                    Image("Background")
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        .opacity(1.0)
                    VStack {
                        Text("Leaderboard")
                            .multilineTextAlignment(.center)
                            .font(Font.custom("PressStartK", size: 300))
                            .foregroundColor(.black)
                            .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.08)
                            .minimumScaleFactor(0.01)
                            .padding(geo.size.width * 0.05)
                        Image("Line")
                            .resizable()
                            .scaledToFit()
                        Text("\(String(gamestate.playersList[0].name.prefix(8))) \(gamestate.playersList[0].score)")
                                .multilineTextAlignment(.center)
                                .font(Font.custom("PressStartK", size: 300))
                                .foregroundColor(.black)
                                .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.06)
                                .minimumScaleFactor(0.01)
                                .textCase(.uppercase)
                        Button(action: {
                            gamestate.appState = .title
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
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(gamestate: GameState())
    }
}
