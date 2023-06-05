//
//  CharacterView.swift
//  Adventure Time Widget
//
//  Created by abdullah's Ventura on 5.06.2023.
//

import SwiftUI
struct CharacterView: View {
    let character : AdventureTimeModel
    var body: some View {
        
        HStack{
            CustomImages(image: Image(character.image))
                .frame(width: 100, height: 100, alignment: .center)
                .padding()
            Spacer()
            VStack{
                Text(character.name)
                    .font(.largeTitle)
                    .fontDesign(.serif)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                Text(String(character.age))
                    .fontDesign(.serif)
                    .fontWeight(.bold)
            }.padding()
            Spacer()
        }.frame(width: UIScreen.main.bounds.width, alignment: .center)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(character: finn)
    }
}
