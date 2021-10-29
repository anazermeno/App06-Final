//
//  ContentView.swift
//  App06-Final
//
//  Created by Clarissa Velásquez Magaña on 29/10/21.
//

import SwiftUI

struct CatalogView: View {
    
    @StateObject var itemModel = ItemModel()
    
    
    var body: some View {
        VStack {
            List {
                ForEach(itemModel.items) { item in
                    Text(item.name)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
