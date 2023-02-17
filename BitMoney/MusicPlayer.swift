//
//  MusicPlayer.swift
//  BitMoney
//
//  Created by Hadi Chaaban on 2/17/23.
//

import Foundation
import AVFoundation

class MusicPlayer {
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?
    var music: Bool = true

    func startBackgroundMusic() {
        if music {
            if let bundle = Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3"){
                let backgroundMusic = NSURL(fileURLWithPath: bundle)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                    guard let audioPlayer = audioPlayer else { return }
                    audioPlayer.numberOfLoops = -1
                    audioPlayer.prepareToPlay()
                    audioPlayer.play()
                } catch {
                    print(error)
                }
            }
        }
    }
    
    func stopBackgroundMusic() {
        music = !music
        guard let audioPlayer = audioPlayer else { return }
        audioPlayer.stop()
    }
}
