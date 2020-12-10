//
//  VideoPlayerHelper.swift
//  Guidebook
//
//  Created by W Lawless on 12/4/20.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func autoPlay(fileName: String, fileFormat: String) -> AVPlayer {
    
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)! )
        videoPlayer?.play()
    }
    
    return videoPlayer!
}
