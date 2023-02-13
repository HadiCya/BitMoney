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
                        .font(Font.custom("PressStartK", size: geo.size.width * 0.08))
                        .foregroundColor(.black)
                        .frame(maxWidth: geo.size.width, alignment: .center)
                        .padding(.bottom, geo.size.height * 0.02)
                        .multilineTextAlignment(.center)
                    Text("Days Survived:\n\(gamestate.day) ")
                        .font(Font.custom("PressStartK", size: geo.size.width * 0.08))
                        .foregroundColor(.black)
                        .frame(maxWidth: geo.size.width, alignment: .center)
                        .padding(.bottom, geo.size.height * 0.02)
                        .multilineTextAlignment(.center)
                    Text("Score:\n\(Double(gamestate.day) * 100.0 * gamestate.scoreMultiplier, specifier: "%.f")")
                        .font(Font.custom("PressStartK", size: geo.size.width * 0.08))
                        .foregroundColor(.black)
                        .frame(maxWidth: geo.size.width, alignment: .center)
                        .padding(.bottom, geo.size.height * 0.02)
                        .multilineTextAlignment(.center)
                    Image("BlankButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.9)
                        .overlay(
                            Text("Log")
                                .font(Font.custom("PressStartK", size: geo.size.width * 0.08))
                                .foregroundColor(.black)
                                .padding(geo.size.width * 0.04)
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
                                  .font(Font.custom("PressStartK", size: geo.size.width * 0.08))
                                  .foregroundColor(.black)
                                  .padding(geo.size.width * 0.04)
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
                                  .font(Font.custom("PressStartK", size: geo.size.width * 0.08))
                                  .foregroundColor(.black)
                                  .padding(geo.size.width * 0.04)
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
