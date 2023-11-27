//
//  TovarView.swift
//  FairPrice
//
//  Created by Natalia D on 24.11.2023.
//

import SwiftUI

struct TovarView: View {
    
    @Binding var tovar: Tovar
    
    @EnvironmentObject var vm: ViewModel
    var tovarIndex = 0
    
    mutating func getIndex() -> Int? {
        return vm.tovary.firstIndex(where: {$0.id == tovar.id})
    }
    
    var body: some View {
        HStack {
            VStack {
                TextField("Товар \(tovarIndex+1)", text: $tovar.name)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: .infinity)
                    .foregroundColor(.secondary)
                HStack {
                    HStack {
                        TextField("Цена", text: $tovar.price)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                        
                        Text("₽ ")
                            .frame(alignment: .trailing)
                    }
                    .border(.black)
                    
                    HStack {
                        
                        TextField("Кол-во", text: $tovar.qty)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                        
                        Text("\(vm.qtyShorts["\(vm.selectedQtyType)"]!) ")
                    }
                    .border(.black)
                }
            }
            
            Text(Double(tovar.price) ?? 0 > 0 && Double(tovar.qty) ?? 0 > 0 ? ("\(Double((Double(tovar.price) ?? 0)/(Double(tovar.qty) ?? 0)), specifier: "%.2f")/\(vm.qtyShorts["\(vm.selectedQtyType)"] ?? "")") : "? / \(vm.qtyShorts["\(vm.selectedQtyType)"] ?? "")")
            
                .frame(width: 100)
                .font(Font.headline.weight(tovar.bestOption ? .bold : .regular))
               
            
        }
        .padding(10)
        .border(tovar.bestOption ? .green : .white, width: 4)
    }
}

struct TovarView_Previews: PreviewProvider {
    
    @State static var tovar = Tovar(id: UUID(), name: "Товар 1", price: "", qty: "13", bestOption: true)
    
    static var previews: some View {
        TovarView(tovar: $tovar)
            .environmentObject(ViewModel())
                               
    }
}
