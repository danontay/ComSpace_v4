//
//  SharedDataModel.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 26.12.2021.
//

import Foundation

class SharedDataModel: ObservableObject {
    
    // Detail Product Data....
    @Published var detailProduct: Event?
    @Published var showDetailProduct: Bool = false
    
    // matched Geoemtry Effect from Search page...
    @Published var fromSearchPage: Bool = false
    
    // Liked Products...
    @Published var likedProducts: [Event] = []
    
    // basket Products...
    @Published var cartProducts: [Event] = []
    
    // calculating Total price...
    func getTotalPrice()->String{
        
        var total: Int = 0
        
        cartProducts.forEach { product in
            
            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
            
            let quantity = product.quantity
            let priceTotal = quantity * price.integerValue
            
            total += priceTotal
        }
        
        return "$\(total)"
    }
}
