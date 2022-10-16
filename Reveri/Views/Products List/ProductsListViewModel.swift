//
//  ProductsListViewModel.swift
//  Reveri
//
//  Created by Mykola Rudenko on 14.10.2022.
//

import Foundation

final class ProductsListViewModel: ObservableObject {
    @Published var isLoading = false
    
    @Published var products: [Product] = []
    
    private var page: Int = 0
    
    private let productContext: ProductSearchable
    
    init(productContext: ProductSearchable) {
        self.productContext = productContext
        initLoading()
    }
    
    func loadNextPage() {
        // TODO: implement next page loading by changing the page value
    }
    
    private func initLoading() {
        loadProductsFor(page: 0)
    }
    
    private func setErrorStateFor(error: Error?) {
        // TODO: implement error state + trigger it's display on view
        // handle nil as not found error or implement a separate error
    }
    
    private func loadProductsFor(page: Int) {
        productContext.search(forPage: page) { [weak self] result in
            guard let self = self else { return }
            //TODO: trigger is loading property and show a spinner on view while loading
            switch result {
            case .success(let success):
                guard let products = success else {
                    self.setErrorStateFor(error: nil)
                    return
                }
                self.products = products.products
                
            case .failure(let failure):
                self.setErrorStateFor(error: failure)
            }
        }
    }
}
