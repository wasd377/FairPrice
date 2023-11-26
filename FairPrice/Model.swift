//
//  Model.swift
//  FairPrice
//
//  Created by Natalia D on 25.11.2023.
//

import Foundation

struct Tovar: Identifiable, Hashable, Equatable {

    var id = UUID()
    var name: String
    var price: String
    var qty: String
    var bestOption: Bool
    
    static var example = Tovar(id: UUID(), name: "Tovar1", price: "1337", qty: "13", bestOption: false)
}
