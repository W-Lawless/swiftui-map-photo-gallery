//
//  VideoModel.swift
//  Guidebook
//
//  Created by W Lawless on 12/4/20.
//

import Foundation


//why struct and not class?
struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //Comp Prop
    var thumbnail: String {
        "video-\(id)"
    }
}
