//
//  SharedDataModel.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 28.12.2021.
//

import SwiftUI

class SharedDataModel: ObservableObject{
  ///Detail Product Data
    @Published var detailEvent: Event?
    @Published var showDetailEvent: Bool = false
    
    
}
