//
//  GameState.swift
//  BitMoney
//
//  Created by Hadi Chaaban on 2/7/23.
//

import Foundation
class GameState : ObservableObject {
    @Published var money: Int
    @Published var day: Int = 1
    @Published var scenario: Scenario
    var scenarios : [Scenario]
    
    init(money: Int){
        self.money = money
        self.scenarios = Scenario.allScenarios.shuffled()
        self.scenario = self.scenarios[Int.random(in: 0..<scenarios.count)]
    }
    
    func update(money: Int){
        self.money += money
        if (self.money <= 0){
            endgame()
            return
        }
        var rand = Int.random(in: 0..<scenarios.count)
        while (self.scenario.id == scenarios[rand].id){
            rand = Int.random(in: 0..<scenarios.count)
        }
        self.scenario = scenarios[rand]
        self.day += 1
    }
    
    func endgame(){
        //END GAME ROUTINE
    }
}
