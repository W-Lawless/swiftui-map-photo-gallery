//
//  CodableBundleExtension.swift
//  Guidebook
//
//  Created by W Lawless on 10/21/20.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // Locate JSON File
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        // Create a data property
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        // Create decoder
        
        let decoder = JSONDecoder()
        
        // Create a property for decoded data
        guard let loaded = try? decoder.decode(T.self, from:data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        // Return ready to use data
        return loaded
        
    }
}
