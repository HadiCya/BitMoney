//
//  DifficultyScreen.swift
//  BitMoney
//
//  Created by Haris Khan on 2/8/23.
//

import SwiftUI




struct DifficultyScreen: View {
    @State private var currentValue = 0.0
    @ObservedObject var gamestate: GameState
    @State private var isActive : Bool = false
    var body: some View {
        GeometryReader { geo in
            ZStack (alignment: .top){
                Image("Background")
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .opacity(1.0)
                VStack {
                    Text("Difficulty\n\n\("N/A")")
                        .font(Font.custom("PressStartK", size: geo.size.width * 0.08))
                        .foregroundColor(.black)
                        .frame(maxWidth: geo.size.width, alignment: .center)
                        .padding(.bottom, geo.size.height * 0.02)
                        .multilineTextAlignment(.center)
                    Text("Score Multiplier\n\n\(abs(currentValue / 150 - 2), specifier: "%.2f")")
                        .font(Font.custom("PressStartK", size: geo.size.width * 0.08))
                        .foregroundColor(.black)
                        .frame(maxWidth: geo.size.width, alignment: .center)
                        .padding(.bottom, geo.size.height * 0.02)
                        .multilineTextAlignment(.center)
                    Text("Starting Cash")
                        .font(Font.custom("PressStartK", size: geo.size.width * 0.08))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)

                    Text("\n$\(Int(currentValue / 10 + 5))")
                        .font(Font.custom("PressStartK", size: geo.size.width * 0.08))
                            .foregroundColor(.black)

                    SliderView1(value: $currentValue)
                       .frame(width: geo.size.width * 0.9)
                       .overlay(
                    
                        VStack{
                            
                           
                            Button(action: {
                                gamestate.appState = .game     
                                gamestate.setMoney(money: Int((currentValue / 10 + 5)))
                                gamestate.scoreMultiplier = (abs(currentValue / 150 - 2))
                            })
                            {
                                Image("BlankButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.9)
                                    
                                    .overlay(
                                        Text("Next")
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
                                        Text("Back")
                                            .font(Font.custom("PressStartK", size: geo.size.width * 0.08))
                                            .foregroundColor(.black)
                                            .padding(geo.size.width * 0.04)
                                    )
                            }
                        }
                       )            
                }
            }
        }
    }
    
}
struct DifficultyScreen_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyScreen(gamestate: GameState())
    }
}
