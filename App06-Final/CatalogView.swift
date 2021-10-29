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
    @State var showCartView : Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(itemModel.items) { item in
                        NavigationLink(destination: ItemDetailView(item: item)) {
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
                                    HStack {
                                        Spacer(minLength: 0)
                                        let formattedPrice = String(format: "%.2f", item.price)
                                        Text("$\(formattedPrice)")
                                            .fontWeight(.heavy)
                                            .foregroundColor(.black)
                                            .padding(.vertical, 5)
                                            .padding(.horizontal, 10)
                                            .cornerRadius(20)
                                            .background(Color("Peach").opacity(0.5))
                                    }
                                    
                                    
                                    KFImage(URL(string: item.image))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 70, height: 70, alignment: .center)
                                    
                                    
                                    Text(item.name)
                                        .font(.system(size: 10, weight: .bold, design: .rounded))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .padding(10)
                                }
                            }
                        }
                    }
                }
                .padding(15)
            }
            .navigationBarTitle("Let's Shop")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                            showCartView = true
                              print("button pressed")
                            }) {
                                Image(systemName: "cart")
                            }
                }
            }
        }
        .sheet(isPresented: $showCartView, content: {
            CartView()
            })
    }
    
    }
               

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
