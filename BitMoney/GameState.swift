//
//  GameState.swift
//  BitMoney
//
//  Created by Hadi Chaaban on 2/7/23.
//

import Foundation


class GameState : ObservableObject {
    
    @Published var appState = AppState.title
    @Published var money: Int = 12
    @Published var day: Int = 1
    @Published var scenario: Scenario
    var scenarios: [Scenario]
    var statuses: [Status: Int] = [:]

    
    init(){
        self.scenarios = Scenario.allScenarios.shuffled()
        self.scenario = self.scenarios[Int.random(in: 0..<scenarios.count)]
    }
    
    func setMoney(money: Int){
        self.money = money
        for status in Status.allCases {
            statuses[status] = self.money
        }
    }
    
    func update(money: Int){
        if let unwrappedStatus = self.scenario.status {
            self.statuses[unwrappedStatus]! -= money + 1
            if self.statuses[unwrappedStatus]! <= 0 {
                self.statuses[Status.health]! -= 1
            }
        }
        self.money += money
        if (self.money <= 0 || self.statuses[Status.health]! <= 0) {
            endgame()
            return
        }
        
        var rand = Int.random(in: 0..<scenarios.count)
        while (self.scenario.id == scenarios[rand].id){
            rand = Int.random(in: 0..<scenarios.count)
        }
        self.scenario = scenarios[rand]
        self.day += 1
        if (self.day % 7 == 0) {
            self.money += 4
        }
    }
    
    func endgame(){
        appState = AppState.end
    }
}
