//
//  SharedDataModel.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 26.12.2021.
//

import Foundation

class SharedDataModel: ObservableObject {
    
    // Detail Product Data....
    @Published var detailEvent: Event?
    @Published var showDetailEvent: Bool = false
    
    // matched Geoemtry Effect from Search page...
    @Published var fromSearchPage: Bool = false
    
    // Liked Products...
    @Published var likedEvents: [Event] = []
    
    // basket Products...
    @Published var cartEvents: [Event] = []
    
    // get total place
    
//    func getPlace()->String{
//        
//        var total: Int = 0
//        
//        cartEvents.forEach { event in
//            
//            let place = event.place
//            total += place
//        }
//        
//        return "$\(total)"
//    }

}
