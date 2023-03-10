//
//  GameState+Leaderboards.swift
//  BitMoney
//
//  Created by Hadi Chaaban on 2/17/23.
//

import Foundation
import GameKit

struct Player: Hashable, Comparable, Identifiable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        return rhs.score > lhs.score
    }
    
    let id = UUID()
    let name: String
    let score: Int

}

extension GameState{
    func authenticateUser() {
        GKLocalPlayer.local.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            self.gameCenterUser = true
        }
    }
    func loadLeaderboard() {
        playersList.removeAll()
        Task{
            var playersListTemp : [Player] = []
            let leaderboards = try await GKLeaderboard.loadLeaderboards(IDs: [leaderboardIdentifier])
            if let leaderboard = leaderboards.filter ({ $0.baseLeaderboardID == self.leaderboardIdentifier }).first {
                let allPlayers = try await leaderboard.loadEntries(for: .global, timeScope: .allTime, range: NSRange(1...50))
                if allPlayers.1.count > 0 {
                    for leaderboardEntry in allPlayers.1 {
                        playersListTemp.append(Player(name: leaderboardEntry.player.displayName, score:leaderboardEntry.score))
                                    print(playersListTemp)
//                        playersListTemp.sort(by: >)
                    }
                }
            }
            playersList = playersListTemp
            playersList = playersList.sorted {
                $0.score < $1.score
            }
            playersList.reverse()
            self.appState = .leaderboard
        }
    }
    func setScoreLeaderboard() {
        Task{
            try await GKLeaderboard.submitScore(
                self.score,
                context: 0,
                player: GKLocalPlayer.local,
                leaderboardIDs: [leaderboardIdentifier]
            )
        }
        //calculateAchievements()
    }
    
}
