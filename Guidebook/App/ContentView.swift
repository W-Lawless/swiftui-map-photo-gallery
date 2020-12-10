//
//  ContentView.swift
//  Guidebook
//
//  Created by W Lawless on 10/21/20.
//

import SwiftUI

struct ContentView: View {
    //MARK: -
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    //MARK: -
    var body: some View {
        
        NavigationView{
            List {
              CoverImageView()
                .frame( height: 300)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { item in
                    NavigationLink(
                        destination: AnimalDetailView(animal: item)) {
                        AnimalListItemView(animal: item)
                    }
                }
            } //: LIST
            .navigationBarTitle("GuideBook", displayMode: .large)
        } //: NAV
        
    } //: BODY
}

//MARK: -
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
