//
//  ViewModel.swift
//  FairPrice
//
//  Created by Natalia D on 24.11.2023.
//

import Foundation




class ViewModel: ObservableObject, Identifiable {
    @Published var tovary: [Tovar]
    
    @Published var selectedQtyType = "килограмм"
    @Published var qtyTypes = ["килограмм", "литр", "штуку"]
    @Published var qtyShorts = ["килограмм" : "кг", "литр" : "л", "штуку" : "шт"]
    @Published var minCost = 0.0
    
    init() {
        tovary = [
            Tovar(id: UUID(), name: "Товар 1", price: "", qty: "", bestOption: false),
            Tovar(id: UUID(), name: "Товар 2", price: "", qty: "", bestOption: false),
            Tovar(id: UUID(), name: "Товар 3", price: "", qty: "", bestOption: false),
            Tovar(id: UUID(), name: "Товар 4", price: "", qty: "", bestOption: false)
        ]
    }
    
    func delete(at offsets: IndexSet) {
        tovary.remove(atOffsets: offsets)
    }
    
    func clearAll() {
        tovary = [
            Tovar(id: UUID(), name: "Товар 1", price: "", qty: "", bestOption: false),
            Tovar(id: UUID(), name: "Товар 2", price: "", qty: "", bestOption: false),
            Tovar(id: UUID(), name: "Товар 3", price: "", qty: "", bestOption: false),
            Tovar(id: UUID(), name: "Товар 4", price: "", qty: "", bestOption: false)
        ]
    }
    
    func calcMinCost() {
            
            for tovar in tovary {
                if (minCost == 0 || minCost > (Double(tovar.price) ?? 0) / (Double(tovar.qty) ?? 0)) && (Double(tovar.price) ?? 0) > 0 && (Double(tovar.qty) ?? 0) > 0  {
                    minCost = (Double(tovar.price) ?? 0) / (Double(tovar.qty) ?? 0)
                }
            }
        
    }
    
    func selectBestOption() {
        
        if minCost > 0 {
        for i in tovary.indices {
          
                if (Double(tovary[i].price) ?? 0) / (Double(tovary[i].qty) ?? 0) == minCost {
                    tovary[i].bestOption = true
                } else {
                    tovary[i].bestOption = false
                }
            }
        }
            
        
    }
}
