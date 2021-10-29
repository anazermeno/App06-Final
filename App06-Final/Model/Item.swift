//
//  Item.swift
//  App06-Final
//
//  Created by Clarissa Velásquez Magaña on 29/10/21.
//

import SwiftUI

struct Item: Identifiable {
    var id: Int
    var name: String
    var price: Double
    var desc: String
    var category: String
    var image: String
    var rate: Double
}

extension Item {
    static let dummy = Item(id: 1, name: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.95, desc: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", category: "men's clothing", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rate: 3.9)
}
