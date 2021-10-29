//
//  ItemModel.swift
//  App06-Final
//
//  Created by Clarissa Velásquez Magaña on 29/10/21.
//

import SwiftUI
import Alamofire

class ItemModel: ObservableObject {
    @Published var items = [Item]()
    
    init() {
        loadItems()
    }
    
    func loadItems() {
        let URL = "https://fakestoreapi.com/products"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default).responseData { data in

            let json = try! JSON(data: data.data!)
            //print(json.count)
            
            var item: Item
            for product in json {
                item = Item(id: product.1["id"].intValue,
                               name: product.1["title"].stringValue,
                               price: product.1["price"].doubleValue,
                               desc: product.1["description"].stringValue,
                               category: product.1["category"].stringValue,
                               image: product.1["image"].stringValue,
                               rate: product.1["rating"]["rate"].doubleValue
                )
                self.items.append(item)
            }
        }
    }
}

