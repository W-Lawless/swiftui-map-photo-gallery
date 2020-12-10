//
//  GalleryView.swift
//  Guidebook
//
//  Created by W Lawless on 10/21/20.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var active: String = "lion"
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    //Grid
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridCol: Double = 3.0
    
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    func gridSlide() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridCol))
    }
    
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // let gridLayout: [GridItem] = [
    //     GridItem(.flexible()),
    //     GridItem(.flexible()),
    //     GridItem(.flexible())
    // ]
    //what is?
    
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            //MARK: - GRID
            
            VStack(alignment: .center, spacing: 30) {
                
                
                //MARK: - ACTIVE IMAGE
                Image(active)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                //MARK: - SLIDER
                
                Slider(value: $gridCol, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridCol) { value in
                        gridSlide()
                    }
                
                
                //MARK: -
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                active = item.image
                                haptic.impactOccurred()
                            }
                    } //: LOOP
                }//: GRID
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                .onAppear {
                    gridSlide()
                }
            } //: VSTQ
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
            
        } //: SCRLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
