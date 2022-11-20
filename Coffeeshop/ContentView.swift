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
        
        if searchText.isEmpty {
            return results
        }
        
        var filteredCoffeeShopResults: [Coffeeshop] = results.filter {
            result in result.name.lowercased().contains(searchText.lowercased())
        }
        
        return filteredCoffeeShopResults
    }
    
    // MARK: VIEWS
    var body: some View {
        NavigationStack {
            List(coffeeShopResults) { coffeeShop in
                Text("\(coffeeShop.name)")
            }
            .navigationTitle("Coffeeshop")
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search coffee shop"
            )
        }
    }
}

// MARK: PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
