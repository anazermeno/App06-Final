//
//  ContentView.swift
//  App06-Final
//
//  Created by Clarissa Velásquez Magaña on 29/10/21.
//

import SwiftUI

struct CatalogView: View {
    
    @StateObject var itemModel = ItemModel()
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(itemModel.items) { item in
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color("Peach"))
                                .frame(height: 200)
                            
                            Text(item.name)
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                .foregroundColor(.black)
                                .padding(10)
                        }
                    }
                }
                .padding(15)
            }
            .navigationBarTitle("Let's Shop")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
