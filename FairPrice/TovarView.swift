//
//  TovarView.swift
//  FairPrice
//
//  Created by Natalia D on 24.11.2023.
//

import SwiftUI

struct TovarView: View {
    
    @Binding var tovar: Tovar
    var width: CGFloat
    var fontSize = CGFloat(20)
    
    @EnvironmentObject var vm: ViewModel
    var tovarIndex = 0
    let textLimit = 5
    
    mutating func getIndex() -> Int? {
        return vm.tovary.firstIndex(where: {$0.id == tovar.id})
    }
    
    var body: some View {
       
            HStack {
                VStack {
                    TextField("Товар \(tovarIndex+1)", text: $tovar.name)//  Text(tovar.bestOption ? "Yep" : "Nope") //
                        .textFieldStyle(.roundedBorder)
                        .frame(width: .infinity)
                        .foregroundColor(.secondary)
                        .font(.system(size: fontSize))
                    
                    HStack {
                        HStack {
                            TextField("0", text: $tovar.price)
                                .multilineTextAlignment(.leading)
                                .keyboardType(.numberPad)
                                .onChange(of: tovar.price) { _ in
                                    tovar.price = String(tovar.price.prefix(textLimit))
                                    }
                            
                            Text("₽ ")
                                .multilineTextAlignment(.leading)
                        }
                        .padding(.horizontal)
                        .border(.black)
                        .font(.system(size: fontSize))
                        
                        
                        HStack {
                            
                            TextField("0", text: $tovar.qty)
                                .multilineTextAlignment(.leading)
                                .keyboardType(.numberPad)
                                .onChange(of: tovar.qty) { _ in
                                    tovar.qty = String(tovar.qty.prefix(textLimit))
                                    }
                            
                            Text("\(vm.qtyShorts["\(vm.selectedQtyType)"]!) ")
                        }
                        .padding(.horizontal)
                        .border(.black)
                        .font(.system(size: fontSize))
                      
                    }
                }
                
                Text(Double(tovar.price) ?? 0 > 0 && Double(tovar.qty) ?? 0 > 0 ? ("\(Double(((Double(tovar.price) ?? 0)*1000)/(Double(tovar.qty) ?? 0)), specifier: "%.2f") ₽ / \(vm.qtyFull["\(vm.selectedQtyType)"] ?? "")") : "? ₽ / \(vm.qtyFull["\(vm.selectedQtyType)"] ?? "")")
                    .frame(width: width * 0.37)
                // .frame(width: 100)
                //    .font(Font.headline.weight(tovar.bestOption ? .bold : .regular))
                    .font(tovar.bestOption ? .system(size: fontSize, weight: .bold) : .system(size: fontSize, weight: .regular))
                
                
                
            }
            .padding(10)
            .border(tovar.bestOption ? .green : .white, width: 4)
        }
    
}

struct TovarView_Previews: PreviewProvider {
    
    @State static var tovar = Tovar(id: UUID(), name: "Товар 1", price: "", qty: "", bestOption: true)
    @State static var width = CGFloat(200.0)
    
    static var previews: some View {
        TovarView(tovar: $tovar, width: width)
            .environmentObject(ViewModel())
                               
    }
}
