//
//  MusicPlayer.swift
//  BitMoney
//
//  Created by Hadi Chaaban on 2/17/23.
//

import Foundation
import AVFoundation

class MusicPlayer: ObservableObject{
    var audioPlayer: AVAudioPlayer?
    @Published var music: Bool = true

    func startBackgroundMusic(sound: String) {
        if music {
            if let bundle = Bundle.main.path(forResource: sound, ofType: "mp3"){
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
    func startSoundEffect(sound: String){
            if let bundle = Bundle.main.path(forResource: sound, ofType: "mp3"){
                let backgroundMusic = NSURL(fileURLWithPath: bundle)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                    guard let audioPlayer = audioPlayer else { return }
                    audioPlayer.prepareToPlay()
                    audioPlayer.play()
                } catch {
                    print(error)
                }
            }
    }
    
    func stopBackgroundMusic() {
        guard let audioPlayer = audioPlayer else { return }
        audioPlayer.stop()
    }
}
