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
    @Published var currGame: Bool = false
    @Published var gameCenterUser: Bool = false
    var score: Int {
        return Int(Double(self.day) * 100.0 * self.scoreMultiplier)
    }
    var scenarios: [String: Scenario]
    var statuses: [Status: Int] = [:]
    
    var leaderboardIdentifier = "bitMoneyLeaderboard"
    @Published var playersList: [Player] = []

    
    init(){
        self.scenarios = Scenario.allScenarios
        self.scenario = self.scenarios.randomElement()!.value
        authenticateUser()
    }
    
    func setMoney(money: Int){
        currGame = true
        self.day = 1
        self.money = money
        for status in Status.allCases {
            statuses[status] = 12
        }
    }
    
    func update(money: Int, scenario: String = ""){
        
        for status in self.scenario.status{
            self.statuses[status]! -= money + 1
            if self.statuses[status]! <= 0 {
                self.statuses[status]! = 0
                self.statuses[Status.health]! -= 1
            }
        }
        
        self.money += money
        if (self.money < 0 || self.statuses[Status.health]! <= 0) {
            endgame()
            return
        }
        
//        if let unpackedScenario = scenario {
//            //self.scenario = scenarios[unpackedScenario]
//        }
//        var rand = Int.random(in: 0..<scenarios.count)
//        while (self.scenario[id] == self.scenario.randomElement()?.key){
//            rand = Int.random(in: 0..<scenarios.count)
//        }
//        self.scenario = scenarios[rand]
        if scenario != "" {
            self.scenario = self.scenarios[scenario]!
        } else {
            var temp = self.scenarios.randomElement()!.value
            while (self.scenario.title == temp.title){
                temp = self.scenarios.randomElement()!.value
            }
            self.scenario = temp
        }
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
        currGame = false
        
        setScoreLeaderboard()
        appState = AppState.end
    }
}
