//
//  ContentView.swift
//  BitMoney
//
//  Created by Haris Khan on 2/8/23.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    @StateObject var gameState = GameState()
    @StateObject var musicPlayer = MusicPlayer()
    @StateObject var soundPlayer = MusicPlayer()
    
    var body: some View {
        switch gameState.appState {
        case .title:
            TitleScreen(gamestate: gameState, soundplayer: soundPlayer)
        case .game:
            GameScreen(gamestate: gameState, musicplayer: musicPlayer, soundplayer: soundPlayer)
        case .end:
            EndScreen(gamestate: gameState, soundplayer: soundPlayer)
        case .difficulty:
            DifficultyScreen(gamestate: gameState, soundplayer: soundPlayer)
        case .settings:
            SettingsScreen(gamestate: gameState, musicplayer: musicPlayer, soundplayer: soundPlayer)
        case .leaderboard:
            LeaderboardScreen(gamestate: gameState, soundplayer: soundPlayer)
        case .log:
            LogScreen(gamestate: gameState, soundplayer: soundPlayer)
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
    case log
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
