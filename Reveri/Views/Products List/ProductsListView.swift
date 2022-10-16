//
//  ContentView.swift
//  Reveri
//
//  Created by Mykola Rudenko on 14.10.2022.
//

import SwiftUI

struct ProductsListView: View {
    @ObservedObject var viewModel: ProductsListViewModel
    
    var body: some View {
        NavigationView(content: {
            VStack {
                ProductListHeaderView(title: "Product List")
                Divider()
                List(viewModel.products) { product in
                    ProductCellView(viewModel: ProductCellViewModel(model: product))
                        .listRowSeparator(.hidden)
                }
                .scrollContentBackground(.hidden)
                .listStyle(PlainListStyle())
                
            }
            
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView(viewModel: ProductsListViewModel(productContext: ProductSearchContext(networkManager: nil, decodableManager: nil)))
    }
}

private struct ProductListHeaderView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .mainTitleStyle()
            .padding()
    }
}
