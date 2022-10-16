//
//  Product.swift
//  Reveri
//
//  Created by Mykola Rudenko on 14.10.2022.
//

import Foundation

class Product: Codable, Identifiable {
    lazy var displayPrice: String = {
        "\(price)" + currentcySymbol
    }()
    var mainImageUrl: URL? {
        images.first
    }
    
    let id: Int
    let title: String
    let brand: String?
    let description: String?
    let images: [URL]
    private let price: Double
    private let currentcySymbol = "$"
}
