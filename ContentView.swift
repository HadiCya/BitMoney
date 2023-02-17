//
//  ContentView.swift
//  BitMoney
//
//  Created by Haris Khan on 2/8/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameState = GameState()
    @StateObject var musicPlayer = MusicPlayer()
    var body: some View {
        switch gameState.appState {
        case .title:
            TitleScreen(gamestate: gameState)
        case .game:
            GameView(gamestate: gameState, musicplayer: musicPlayer)
        case .end:
            EndScreen(gamestate: gameState)
        case .difficulty:
            DifficultyScreen(gamestate: gameState)
        case .settings:
            SettingsPage(gamestate: gameState, musicplayer: musicPlayer)
        case .leaderboard:
            LeaderboardView(gamestate: gameState)
        
        }
    }
}

enum AppState {
    case title
    case game
    case end
    case difficulty
    case settings
    case leaderboard
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
