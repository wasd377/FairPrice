//
//  ContentView.swift
//  FairPrice
//
//  Created by Natalia D on 24.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm : ViewModel

    var body: some View {
        
        
        NavigationView {
            GeometryReader { geometry in
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
                    .font(.system(size: 20, weight: .semibold))
                    List {
                        ForEach($vm.tovary, id: \.id) { $tovar in
                            TovarView(tovar: $tovar, width: geometry.size.width)
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
