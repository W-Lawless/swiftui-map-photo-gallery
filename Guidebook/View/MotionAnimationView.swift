//
//  MotionAnimationView.swift
//  Guidebook
//
//  Created by W Lawless on 12/6/20.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var ranN = Int.random(in: 12...16)
    @State private var isAnim: Bool = false
    
    //MARK: - Functions
    
    // ran Coord
    func ranCoord(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    // ran Size
    func ranSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    // ran Scale
    func ranScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // ran Speed
    func ranSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    // ran Delay
    func ranDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        
        //* GEO
        GeometryReader { geo in
        
            //* ZSTQ
            ZStack {

                //* LOOP
                ForEach(0...ranN, id: \.self) { item in
                    
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: ranSize(), height: ranSize(), alignment: .center)
                        .scaleEffect(isAnim ? ranScale() : 1)
                        .position(
                            x: ranCoord(max: geo.size.width),
                            y: ranCoord(max: geo.size.height) )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(ranSpeed())
                                .delay(ranDelay())        )//: ANIMATION
                        .onAppear(perform: {
                            isAnim = true
                        })
                    
                } //: LOOP

                //                Text("Width: \(Int(geo.size.width)), Height: \(Int(geo.size.height))")
            
            } //: ZSTQ
            .drawingGroup()
            //Drawing Group optimizes rendering for a stack
        
        } //: GEO READER
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
