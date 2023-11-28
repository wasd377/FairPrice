//
//  SwiftUIView.swift
//  FairPrice
//
//  Created by Natalia D on 28.11.2023.
//

import SwiftUI

struct SwiftUIView: View {
    
    var a = 5
    var b = 10000
 
    func calc() {
        var c = b/a
    }
    
    var body: some View {
    
        var c = b/(1000*a)
        var d = b/a/1000
        
//        10000/(1000*5) = 2
//        10000/5 = 2000/1000 = 2
        
        VStack{
            Text("\(a)")
            Text("\(b)")
            Text("\(c)")
            Text("\(d)")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
