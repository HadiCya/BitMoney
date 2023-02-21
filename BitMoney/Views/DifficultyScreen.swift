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
    @State private var sliderMath = 2.0 + (2.0 / 9.0)
    @State private var moneyMath = 33.0 + (1.0 / 3.0)
    var body: some View {
        GeometryReader { geo in
            ZStack (alignment: .top){
                Image("Background")
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .opacity(1.0)
                VStack {
                    Text("Difficulty\n\n\(calculateDifficulty(val: (Int(moneyMath * (currentValue / (geo.size.width * 0.85)) + 5))))")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("PressStartK", size: 300))
                         .foregroundColor(.black)
                         .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.12)
                         .minimumScaleFactor(0.01)
                         .padding(geo.size.width * 0.05)
                    Text("Score Multiplier\n\n\(abs(sliderMath * (currentValue / (geo.size.width * 0.85)) - 2), specifier: "%.2f")")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("PressStartK", size: 300))
                         .foregroundColor(.black)
                         .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.12)
                         .minimumScaleFactor(0.01)
                         .padding(geo.size.width * 0.05)
                    Text("Starting Cash")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("PressStartK", size: 300))
                         .foregroundColor(.black)
                         .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.08)
                         .minimumScaleFactor(0.01)

                    Text("\n$\(Int(moneyMath * (currentValue / (geo.size.width * 0.85)) + 5))")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("PressStartK", size: 300))
                         .foregroundColor(.black)
                         .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.08)
                         .minimumScaleFactor(0.01)
                         .padding(geo.size.width * 0.05)

                    SliderView1(value: $currentValue)
                       .frame(width: geo.size.width * 0.9)
                       .overlay(
                    
                        VStack{
                            
                           
                            Button(action: {
                                gamestate.appState = .game
                                gamestate.setMoney(money: Int(moneyMath * (currentValue / (geo.size.width * 0.85)) + 5))
                                gamestate.scoreMultiplier = abs(sliderMath * (currentValue / (geo.size.width * 0.85)) - 2)
                            })
                            {
                                Image("BlankButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.9)
                                    
                                    .overlay(
                                        Text("Next")
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
                       )            
                }
            }
        }
    }
    
}

func calculateDifficulty(val: Int) -> String{
    if val > 25{
        return "Easy"
    }
    if val > 15 {
        return "Medium"
    }
    return "Hard"
}
struct DifficultyScreen_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyScreen(gamestate: GameState())
    }
}
