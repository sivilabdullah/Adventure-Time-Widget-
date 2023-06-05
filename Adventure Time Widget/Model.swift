//
//  Model.swift
//  Adventure Time Widget
//
//  Created by abdullah's Ventura on 5.06.2023.
//

import Foundation

struct AdventureTimeModel : Identifiable , Codable{
   
    var id : String {name}
    let image : String
    let name : String
    let age : Int
    
    
}

let finn  = AdventureTimeModel(image: "finn", name: "Finn", age: 18)
let jack = AdventureTimeModel(image: "jake", name: "Jake", age: 19)
let bubblegum = AdventureTimeModel(image: "bubblegum", name: "Bubble Gum", age: 18)
