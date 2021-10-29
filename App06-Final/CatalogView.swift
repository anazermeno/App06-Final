//
//  ContentView.swift
//  App06-Final
//
//  Created by Clarissa Velásquez Magaña on 29/10/21.
//

import SwiftUI
import Kingfisher

struct CatalogView: View {
    
    @StateObject var itemModel = ItemModel()
    private let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(itemModel.items) { item in
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                                .frame(height: 200)
                                .overlay {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color("Peach"), lineWidth: 3)
                                    }
                                }
                            VStack {
                                KFImage(URL(string: item.image))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80, alignment: .center)
                                
                                
                                Text(item.name)
                                    .font(.system(size: 15, weight: .bold, design: .rounded))
                                    .foregroundColor(.black)
                                    .padding(10)
                            }
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
