//
//  CustomImages.swift
//  Adventure Time Widget
//
//  Created by abdullah's Ventura on 5.06.2023.
//

import SwiftUI

struct CustomImages: View {
    var image : Image
    var body: some View {
        image.resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color .blue, lineWidth: 1))
            .shadow(radius: 5)
            
    }
}

struct CustomImages_Previews: PreviewProvider {
    static var previews: some View {
        CustomImages(image: Image("finn"))
    }
}
