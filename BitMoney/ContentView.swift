//
//  ContentView.swift
//  BitMoney
//
//  Created by Hadi Chaaban on 2/3/23.
//

import SwiftUI
import CoreData

class GameState : ObservableObject {
    @Published var money: Int
    @Published var day: Int
    @Published var scenario: Scenario
    var scenarios : [Scenario]
    //Add score modifier
    
    init(money: Int){
        self.money = money
        self.day = 1
        self.scenarios = Scenario.allScenarios.shuffled()
        self.scenario = self.scenarios[0]
    }
    
    func update(money: Int){
        self.money += money
        self.scenario = scenarios[self.day]
        self.day += 1
        
    }
}

struct ContentView: View {
    @StateObject var gamestate = GameState(money: 12)
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
                                Image("MenuButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.1)
                                Text("Day 1")
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
                        .foregroundColor(.black)
                    
                    ForEach(gamestate.scenario.choiceArr, id: \.title) { choice in
                        Button(action: {
                            gamestate.update(money: choice.outcome)
                        }) {
//                            var dolladolla = ""
//                            for
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
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
