//
//  CoffeeListView.swift
//  Coffeeshop
//
//  Created by Aransa Prawira on 20/11/22.
//

import SwiftUI

struct CoffeeListView: View {
    // MARK: PROPERTIES
    @State private var searchText: String = ""
    
    private var coffeeShopResults: [Coffeeshop] {
        let results = CoffeeshopProvider.all()
        
        if searchText.isEmpty {
            return results
        }
        
        let filteredCoffeeShopResults: [Coffeeshop] = results.filter {
            result in result.name.lowercased().contains(searchText.lowercased())
        }
        
        return filteredCoffeeShopResults
    }
    
    private var suggestedCoffeeShop: [Coffeeshop] {
        if searchText.isEmpty {
            return []
        }
        
        return coffeeShopResults
    }
    
    // MARK: VIEWS
    var body: some View {
        NavigationStack {
            List(coffeeShopResults) { coffeeShop in
                NavigationLink(
                    destination: {
                        CoffeeShopDetailView(coffeeShop: coffeeShop)
                    },
                    label: {
                        Text("\(coffeeShop.name)")
                    }
                )
            }
            .navigationTitle("Coffeeshop")
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search coffee shop"
            ) {
                ForEach(suggestedCoffeeShop) { coffeeShop in
                    Text("Looking for \(coffeeShop.name)?")
                        .foregroundColor(.blue)
                        .searchCompletion(coffeeShop.name)
                }
            }
        }
    }
}

struct CoffeeListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeListView()
    }
}
