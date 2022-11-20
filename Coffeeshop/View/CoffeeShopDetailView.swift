//
//  CoffeeShopDetailView.swift
//  Coffeeshop
//
//  Created by Aransa Prawira on 20/11/22.
//

import SwiftUI

struct CoffeeShopDetailView: View {
    // MARK: PROPERTIES
    let coffeeShop: Coffeeshop
    
    // MARK: VIEWS
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.white, .blue],
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea()
            
            VStack(alignment: .center) {
                Image(coffeeShop.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .opacity(0.6)
                        
                        VStack {
                            Image(systemName: "person.crop.circle.fill.badge.plus")
                                .resizable()
                                .renderingMode(.original)
                                .foregroundColor(.blue)
                                .scaledToFit()
                                .frame(width: 50)
                            
                            Text(coffeeShop.name)
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                        }
                    }
                
                Spacer()
                    .frame(height: 50)
                
                Text(coffeeShop.review)
                    .font(.system(.title2, design: .rounded))
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 30)
                
                HStack {
                    
                    Circle()
                        .foregroundColor(.primary)
                        .opacity(0.4)
                        .frame(width: 40)
                        .overlay {
                            Image(systemName: "pin")
                                .foregroundColor(.white)
                        }
                    
                    Text(coffeeShop.location)
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    .bold()
                }
                
            }.padding()
        }
    }
}

struct CoffeeShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopDetailView(
            coffeeShop: Coffeeshop(
                image: "bojaeatery",
                name: "Boja Eatery",
                location: "Jl. Sumatera No. 21, Kota Bandung",
                review: "The food is delicious, cooked just right.  Friendly service.  Cozy atmosphere with floral decorations.  There is a ~robot~ that sends the dish.  Prices are reasonable for a restaurant of its class")
        )
    }
}
