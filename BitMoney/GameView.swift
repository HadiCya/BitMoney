//
//  ContentView.swift
//  BitMoney
//
//  Created by Hadi Chaaban on 2/3/23.
//  Edited by Zanon

import SwiftUI
import CoreData

struct GameView: View {
    @ObservedObject var gamestate: GameState
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Image("Background")
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .opacity(1.0)
                VStack{
                    VStack{
                        Image("Line")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width, height: geo.size.height * 0.01,alignment: .top)
                        ZStack(alignment: .topLeading) {
                            HStack() {
                                Button(action: {
                                   gamestate.appState = .title
                               })
                              {
                                  Image("MenuButton")
                                      .resizable()
                                      .scaledToFit()
                                      .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.1)
                              }
                                
                                Text("Day \(gamestate.day)")
                                   .font(Font.custom("PressStartK", size: 300))
                                    .foregroundColor(.black)
                                    .frame(width: geo.size.width * 0.36, height: geo.size.height * 0.03)
                                    .minimumScaleFactor(0.01)
                                Image("MoneyCountBox")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.27, height: geo.size.height * 0.1)
                                    .overlay(
                                        Text("$\(gamestate.money)")
                                            .font(Font.custom("PressStartK", size: 300))
                                            .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.2)
                                            .minimumScaleFactor(0.01)
                                            .foregroundColor(.black)
                                    )
                            }
                        }
                        Image("Line")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width, height: geo.size.height * 0.01,alignment: .center)
                    }
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
//                    Text("HEALTH of my low IQ " + String(gamestate.statuses[Status.health].unsafelyUnwrapped))
//                    Text("Fatness " + String(gamestate.statuses[Status.hunger].unsafelyUnwrapped))
//                    Text("Lonler " + String(gamestate.statuses[Status.social].unsafelyUnwrapped))
//                    Text("Happiness " + String(gamestate.statuses[Status.happiness].unsafelyUnwrapped))
                    Text(gamestate.scenario.title)
                        .font(Font.custom("PressStartK", size: 300))
                         .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.15)
                         .minimumScaleFactor(0.01)
                         .foregroundColor(.black)
                    
                    ForEach(gamestate.scenario.choiceArr, id: \.title) { choice in
                        Button(action: {gamestate.update(money: choice.outcome)})
                        {
                            Image("BlankButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.9)
                                .overlay(
                                    Text(choice.title + " \(dollaSigns(money: choice.outcome))")
                                        .font(Font.custom("PressStartK", size: 300))
                                         .foregroundColor(.black)
                                         .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.06)
                                         .minimumScaleFactor(0.01)
                                    
                                )
                           
                            }
                       
                        
                    }
                }
                
            }

            
        }
    }
}

func dollaSigns(money: Int) -> String{
    var dolla = ""
    if money > 0 {
        dolla = "(+"
    } else if money < 0 {
        dolla = "(-"
    } else {
        return dolla
    }
    (1...abs(money)).forEach { val in
        dolla += "$"
    }
    dolla += ")"
    return dolla
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gamestate: GameState())
            .previewDevice(/*@START_MENU_TOKEN@*/"iPhone 11"/*@END_MENU_TOKEN@*/)
        GameView(gamestate: GameState())
            .previewDevice(/*@START_MENU_TOKEN@*/"iPhone 14 Pro Max"/*@END_MENU_TOKEN@*/)
        GameView(gamestate: GameState())
            .previewDevice(/*@START_MENU_TOKEN@*/"iPhone 14"/*@END_MENU_TOKEN@*/)
            
    }
}
