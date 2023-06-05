//
//  ContentView.swift
//  Adventure Time Widget
//
//  Created by abdullah's Ventura on 5.06.2023.
//

import SwiftUI
import WidgetKit
let characterArray = [finn,jack,bubblegum]
struct ContentView: View {
    
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.adotech.Adventure-Time-Widget"))
    var characterData : Data = Data()
    
    var body: some View {
        VStack{
            ForEach(characterArray) { array in
                CharacterView(character: array).onTapGesture(count: 1) {
                    saveToDefaults(character: array)
                }
            }
        }
        
    }
    
    func saveToDefaults(character : AdventureTimeModel){
        //print(character.name)
        
        if let characterData  = try? JSONEncoder().encode(character){
            self.characterData = characterData
            
            print(character.name)
            WidgetCenter.shared.reloadTimelines(ofKind: "AdventureTimeWidgets" )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
