//
//  Order.swift
//  HotCoffee
//
//  Created by Smiles on 20/05/19.
//  Copyright © 2019 Mariana. All rights reserved.
//

import Foundation

enum CoffeeType: String, Codable {
    case cappuccion
    case latte
    case espressino
    case cortado
}

enum CoffeeSize : String, Codable {
    case small
    case medium
    case large
}

struct Order : Codable {
    let name : String
    let email : String
    let type : CoffeeType
    let size : CoffeeSize
    
}
