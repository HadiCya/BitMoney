//
//  ContentView.swift
//  BitMoney
//
//  Created by Hadi Chaaban on 2/3/23.
//

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
                                    .font(Font.custom("PressStartK", size: geo.size.width * 0.04))
                                    .foregroundColor(.black)
                                    .frame(width: geo.size.width * 0.36, height: geo.size.height * 0.1)
                                Image("MoneyCountBox")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.27, height: geo.size.height * 0.1)
                                    .overlay(
                                        Text("$\(gamestate.money)")
                                            .font(Font.custom("PressStartK", size: geo.size.width * 0.05))
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
                    Text(gamestate.scenario.title)
                        .font(Font.custom("PressStartK", size: geo.size.width * 0.05))
                        .padding(geo.size.width * 0.05)
                        .foregroundColor(gamestate.scenario.status?.color)
                    
                    ForEach(gamestate.scenario.choiceArr, id: \.title) { choice in
                        Button(action: {gamestate.update(money: choice.outcome)})
                        {
                            Image("BlankButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.9)
                                .overlay(
                                    Text(choice.title + " (\(choice.outcome))")
                                        .font(Font.custom("PressStartK", size: geo.size.width * 0.04))
                                        .foregroundColor(.black)
                                        .padding(geo.size.width * 0.04)
                                )
                           
                            }
                       
                        
                    }
                }
//                Popup()
//                    .frame(width: geo.size.width)
                
            }
            
        }
    }
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
