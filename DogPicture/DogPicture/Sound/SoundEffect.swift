//
//  SoundEffect.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/05.
//

import Foundation
import AVFoundation
import AVKit

class SoundEffect {
    static let instance = SoundEffect()
    
    var player: AVPlayer?
    
    enum SoundOption: String {
        case bellsound
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        player = AVPlayer(url: url)
        player?.play()
    }
}
