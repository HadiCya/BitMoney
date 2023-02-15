//
//  EndScreen.swift
//  BitMoney
//
//  Created by Haris Khan on 2/7/23.
//

import Foundation   
import SwiftUI

struct EndScreen: View {
    @ObservedObject var gamestate: GameState
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
                    Text("!GAME OVER!")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("PressStartK", size: 300))
                         .foregroundColor(.black)
                         .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.08)
                         .minimumScaleFactor(0.01)
                         .padding(geo.size.width * 0.05)
                    Text("Days Survived:\n\(gamestate.day) ")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("PressStartK", size: 300))
                         .foregroundColor(.black)
                         .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.12)
                         .minimumScaleFactor(0.01)
                         .padding(geo.size.width * 0.05)
                    Text("Score:\n\(Double(gamestate.day) * 100.0 * gamestate.scoreMultiplier, specifier: "%.f")")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("PressStartK", size: 300))
                         .foregroundColor(.black)
                         .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.08)
                         .minimumScaleFactor(0.01)
                         .padding(geo.size.width * 0.05)
                    Image("BlankButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.9)
                        .overlay(
                            Text("Log")
                                .multilineTextAlignment(.center)
                                .font(Font.custom("PressStartK", size: 300))
                                 .foregroundColor(.black)
                                 .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.05)
                                 .minimumScaleFactor(0.01)
                        )
                    Button(action: {
                        gamestate.appState = .difficulty
                   })
                  {
                      Image("BlankButton")
                          .resizable()
                          .scaledToFit()
                          .frame(width: geo.size.width * 0.9)
                          .overlay(
                              Text("Restart")
                                .multilineTextAlignment(.center)
                                .font(Font.custom("PressStartK", size: 300))
                                 .foregroundColor(.black)
                                 .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.05)
                                 .minimumScaleFactor(0.01)
                          )
                  }
                   
                    Button(action: {
                        gamestate.appState = .title
                   })
                  {
                      Image("BlankButton")
                          .resizable()
                          .scaledToFit()
                          .frame(width: geo.size.width * 0.9)
                          .overlay(
                              Text("Main Menu")
                                .multilineTextAlignment(.center)
                                .font(Font.custom("PressStartK", size: 300))
                                 .foregroundColor(.black)
                                 .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.05)
                                 .minimumScaleFactor(0.01)
                          )
                  }
                    
                    Image("ShareIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.1)
                        .padding(.top, geo.size.height * 0.04)
                }
            }
        }
    }
}



struct EndScreen_Previews: PreviewProvider {
    static var previews: some View {
        EndScreen(gamestate: GameState())
    }
}
