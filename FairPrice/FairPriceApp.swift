//
//  FairPriceApp.swift
//  FairPrice
//
//  Created by Natalia D on 24.11.2023.
//

import SwiftUI

@main
struct FairPriceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
        
    }
}
