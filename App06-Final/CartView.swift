//
//  CartView.swift
//  App06-Final
//
//  Created by Clarissa Velásquez Magaña on 29/10/21.
//

import SwiftUI
import Kingfisher

struct CartView: View {
    var totalPrice:Double = addPrices()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(cartArray) { item in
                        HStack {
                            KFImage(URL(string: item.image))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30, alignment: .leading)
                            Spacer()
                            Text(item.name)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                            Text(String(format: "$%.2f", item.price))
                        }
                        
                    }
                }
                .listStyle(.plain)
                .padding(.top, 50)
                
                HStack {
                    Spacer()
                    Text("Total: ")
                    Spacer()
                    Text(String(format: "$%.2f", totalPrice))
                    Spacer()
                }
                .font(.title2)
                .padding(.bottom, 80)
            }
            .navigationTitle("Cart")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Cart")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                        .padding(.top, 100)
                        .padding(.bottom, 35)
                }
            }
        }
        
    }
}

func addPrices() -> Double {
    var suma: Double = 0.0
    for index in 0..<cartArray.count {
        suma = cartArray[index].price + suma
    }
    
    return suma
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
