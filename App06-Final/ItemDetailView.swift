//
//  ProductDetailView.swift
//  App06_FinalApp1
//
//  Created by Ana Zermeño torres on 29/10/21.
//

import SwiftUI
import Kingfisher

struct ItemDetailView: View {
    
    var item: Item
    @State var shopItem: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                KFImage(URL(string: item.image))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
                Text("\(item.name)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                Text(String(format: "Price: $%.2f", item.price))
                    .padding(.bottom, 5)
                Text("\(item.desc)")
                    .padding(.trailing, 30)
                    .padding(.leading, 30)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)
                Text("Category: \(item.category)")
                    .padding(.bottom, 30)
                Button(action: {
                    shopItem = true
                }, label: {
                    HStack {
                        Image(systemName: "cart.fill")
                            .font(.largeTitle)
                        Text("Add to cart")
                    }
                    .padding()
                    .background(Color("Peach"))
                    .cornerRadius(20)
                })
            }
            .foregroundColor(Color("TextColor"))
        }
        .edgesIgnoringSafeArea(.all)
        //.sheet(isPresented: $showEditView, content: {
        //   EditView(matricula: $matricula, birthday: $birthday, weight: $weight, height: $height)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: Item.dummy)
    }
}
