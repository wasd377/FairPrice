//
//  ContentView.swift
//  FairPrice
//
//  Created by Natalia D on 24.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm : ViewModel
    
    @State private var tovar1name = ""
    @State private var tovar2name = ""
    @State private var tovar3name = ""
    @State private var tovar4name = ""
    
    @State private var tovar1price = ""
    @State private var tovar2price = ""
    @State private var tovar3price = ""
    @State private var tovar4price = ""
    
    @State private var tovar1qty = ""
    @State private var tovar2qty = ""
    @State private var tovar3qty = ""
    @State private var tovar4qty = ""
    
    @State private var tovar1best = false
    @State private var tovar2best = false
    @State private var tovar3best = false
    @State private var tovar4best = false
    
    @State var option1 = 0.0
    @State var option2 = 0.0
    @State var option3 = 0.0
    @State var option4 = 0.0
    
    @State private var textpobedi = "1337"

    var body: some View {
        
        
        NavigationView {
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("Сравнить цену за")
                        Menu("\(vm.selectedQtyType)") {
                            Button("\(vm.qtyTypes[0])") { vm.selectedQtyType = vm.qtyTypes[0] }
                            Button("\(vm.qtyTypes[1])") { vm.selectedQtyType = vm.qtyTypes[1] }
                            Button("\(vm.qtyTypes[2])") { vm.selectedQtyType = vm.qtyTypes[2] }
                                .buttonStyle(.bordered)
                        }
                        
                    }
                    .padding()
                    .font(.headline)
                    List {
                        ForEach($vm.tovary, id: \.id) { $tovar in
                            TovarView(tovar: $tovar)
                                .listRowInsets(.init())
                        }
                        .onDelete(perform: vm.delete)
                        Text("Введите данные разных товаров и узнайте их честную цену за килограмм, литр или штуку, для того, чтобы сделать правильный выбор при покупке!")
                            .padding()
                            
                            
                    }
                    .listStyle(.plain)
                    
                    
                
                    
                    HStack {
                        Spacer()
                        Button("Добавить товар") {
                            vm.tovary.append(Tovar(id:UUID(),name: "Товар \(vm.tovary.count+1)", price: "", qty: "", bestOption: false))
                        }
                        Button("Очистить") {
                            vm.clearAll()
                        }
                        .buttonStyle(.borderedProminent)
                        Spacer()
                    }
                }
               
                
            
         
            
            .navigationTitle("Честная Цена")
            .onChange(of: vm.tovary) { _ in
                vm.calcMinCost()
                vm.selectBestOption()
            }
        }
    }
        
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
