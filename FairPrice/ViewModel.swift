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
    @Published var qtyShorts = ["килограмм" : "г", "литр" : "мл", "штуку" : "шт"]
    @Published var qtyFull = ["килограмм" : "кг", "литр" : "л", "штуку" : "шт"]
    @Published var minCost = 0.0
    
    init() {
        tovary = [
            Tovar(id: UUID(), name: "", price: "", qty: "", bestOption: false),
            Tovar(id: UUID(), name: "", price: "", qty: "", bestOption: false),
        ]
    }
    
    func delete(at offsets: IndexSet) {
        tovary.remove(atOffsets: offsets)
    }
    
    func clearAll() {
        
        for i in tovary.indices {
       
            tovary[i].id = UUID()
            tovary[i].name = "Товар \(i+1)"
            tovary[i].price = ""
            tovary[i].qty = ""
            tovary[i].bestOption = false
            
            }
        

    }
    
    func calcMinCost() {
        
        minCost = 0.0
            
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
