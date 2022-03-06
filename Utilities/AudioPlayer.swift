//
//  AudioPlayer.swift
//  Restart
//
//  Created by Camelia Braghes on 03.03.2022.
//  https://credo.academy

import Foundation
import AVFoundation

///audio property to play a sound file.
var audioPlayer : AVAudioPlayer?

/// A function that we can run each time to want to play any sound file.
/// - Parameters:
///   - sound: the name of the sound file.
///   - type: the name of the file extension.
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not play the sound file.")
        }
    }
}

