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
    @Published var scoreMultiplier: Double = 1
    @Published var showPopUp: String = ""
    var scenarios: [Scenario]
    var statuses: [Status: Int] = [:]

    
    init(){
        self.scenarios = Scenario.allScenarios.shuffled()
        self.scenario = self.scenarios[Int.random(in: 0..<scenarios.count)]
    }
    
    func setMoney(money: Int){
        self.money = money
        for status in Status.allCases {
            statuses[status] = 12
        }
    }
    
    func update(money: Int){
        
        for status in self.scenario.status{
            self.statuses[status]! -= money + 1
            if self.statuses[status]! <= 0 {
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
        if (self.day % 3 == 0){
            for status in Status.allCases{
                if self.statuses[status]! < 5 {
                    self.showPopUp += "Low \(status), "
                }
            }
        }
        self.showPopUp = String(self.showPopUp.dropLast(2))
        if (self.day % 7 == 0) {
            self.money += 4
            self.showPopUp = "Payday! +$$$$"
        }
        
    }
    
//    func statusEffects(statuses: [Status:Int]) -> String{
//        var output = "You are feeling "
//        for status in Status.allCases{
//            if statuses[status]! <= 5 {
//                output += "\(status) "
//            }
//        }
//        output = String(output.dropLast())
//        output += "."
//        return output
//    }
    
    func endgame(){
        appState = AppState.end
    }
}
