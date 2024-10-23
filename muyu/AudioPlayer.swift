//
//  AudioPlayer.swift
//  muyu
//
//  Created by HLF_SUN on 10/23/24.
//

import AVFoundation
import Foundation
import SwiftUI

var soundPlayer: AVAudioPlayer?

func playAudio(forResource: String, ofType: String) {
    let path = Bundle.main.path(forResource: forResource, ofType: ofType)!
    let url = URL(fileURLWithPath: path)

    do {
        soundPlayer = try AVAudioPlayer(contentsOf: url)
        soundPlayer?.play()
    } catch {
        print("音频文件出现问题")
    }
}
