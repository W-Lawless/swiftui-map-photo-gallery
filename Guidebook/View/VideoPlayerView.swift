//
//  VideoPlayerView.swift
//  Guidebook
//
//  Created by W Lawless on 12/4/20.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    var videoSelected: String
    var videoTitle: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: autoPlay(fileName: videoSelected, fileFormat: "mp4"))
            {
                //Text(videoTitle)
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:32, height:32)
                    .padding(.top, 6)
                    .padding(.horizontal, 12)
                , alignment: .topLeading
            )
        } //: VSTQ
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
