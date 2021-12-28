//
//  Event.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 27.12.2021.
//

import SwiftUI

// Product Model....
struct Event: Identifiable,Hashable {
    var id = UUID().uuidString
    var type: EventType
    var title: String
    var subtitle: String
    var description: String = ""
    var date: String
    var eventImage: String = ""
    var place: Int = 1
}

// Product Types...
enum EventType: String,CaseIterable{
    case IT = "IT"
    case DigitalArt = "Digital Art"
//    case Linguistics = "Linguistics"
    case Anteiku = "Anteiku"
//    case Plants = "Plants"
    case Nature = "Nature" 
}

