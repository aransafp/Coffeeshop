//
//  ContentView.swift
//  Coffeeshop
//
//  Created by Aransa Prawira on 20/11/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: PROPERTIES
    @State private var searchText: String = ""
    
    private var coffeeShopResults: [Coffeeshop] {
        let results = CoffeeshopProvider.all()
        
        return results
    }
    
    // MARK: VIEWS
    var body: some View {
        NavigationStack {
            List(coffeeShopResults) { coffeeShop in
                Text("\(coffeeShop.name)")
            }
            .navigationTitle("Coffeeshop")
            .searchable(text: $searchText)
        }
    }
}

// MARK: PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
