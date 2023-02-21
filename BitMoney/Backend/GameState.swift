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
    @Published var scenario: (String, Scenario)
    @Published var scoreMultiplier: Double = 1
    @Published var showPopUp: String = ""
    @Published var currGame: Bool = false
    @Published var gameCenterUser: Bool = false
    var score: Int {
        return Int(Double(self.day) * 100.0 * self.scoreMultiplier)
    }
    var scenarios: [String: Scenario]
    var history: [(Int, String, String, Int)] = []
    var statuses: [Status: Int] = [:]
    
    var leaderboardIdentifier = "bitMoneyLeaderboard"
    @Published var playersList: [Player] = []

    
    init(){
        self.scenarios = Scenario.allScenarios
        self.scenario = self.scenarios.randomElement()!
        authenticateUser()
    }
    
    func setMoney(money: Int){
        self.history = []
        currGame = true
        self.day = 1
        self.money = money
        for status in Status.allCases {
            statuses[status] = 12
        }
    }
    
    func update(money: Int, title: String, scenario: String = ""){
        history.append((self.day, self.scenario.0, title, money))
        for status in self.scenario.1.status{
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
        if scenario != "" {
            self.scenario.1 = self.scenarios[scenario]!
        } else {
            var temp = self.scenarios.randomElement()!
            while (self.scenario.0 == temp.0){
                temp = self.scenarios.randomElement()!
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
    
    func endgame(){
        currGame = false
        
        setScoreLeaderboard()
        appState = AppState.end
    }
}
