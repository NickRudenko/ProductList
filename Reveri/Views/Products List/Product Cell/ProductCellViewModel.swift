//
//  ProductCellViewModel.swift
//  Reveri
//
//  Created by Mykola Rudenko on 14.10.2022.
//

import Foundation

final class ProductCellViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var brand = ""
    @Published var description = ""
    @Published var price = ""
    @Published var imageUrl: URL? = nil
    
    var model: Product
    
    init(model: Product) {
        self.model = model
        updateDisplayInfo()
    }
    
    private func updateDisplayInfo() {
        title = model.title
        brand = model.brand ?? ""
        description = model.description ?? ""
        price = model.displayPrice
        imageUrl = model.mainImageUrl
    }
}
