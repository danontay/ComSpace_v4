//
//  Event.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 26.12.2021.
//

import Foundation
// Product Model....
struct Event: Identifiable,Hashable {
    var id = UUID().uuidString
    var type: EventType
    var title: String
    var subtitle: String
    var description: String = ""
    var price: String
    var productImage: String = ""
    var quantity: Int = 1
}

// Product Types...
enum EventType: String,CaseIterable{
    case Wearable = "Wearable"
    case Laptops = "Laptops"
    case Phones = "Phones"
    case Tablets = "Tablets"
}

