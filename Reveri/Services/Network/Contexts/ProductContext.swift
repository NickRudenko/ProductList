//
//  ProductContext.swift
//  Reveri
//
//  Created by Mykola Rudenko on 15.10.2022.
//

import Foundation
import Moya

protocol ProductSearchable {
    func search(forPage: Int, completion: @escaping (Result<ProductsResponse?, Error>) -> Void)
}

struct ProductSearchContext: ProductSearchable {
    private let provider = MoyaProvider<API>()
    private let networkManager: NetworkManaging?
    private let decodableManager: DecodableManaging?

    init(networkManager: NetworkManaging?, decodableManager: DecodableManaging?) {
        self.networkManager = networkManager
        self.decodableManager = decodableManager
    }

    func search(forPage: Int, completion: @escaping (Result<ProductsResponse?, Error>) -> Void) {
        networkManager?.executeRequst(provider: provider, apiCall: .productsForPage(forPage)) { result in
            switch result {
            case .success(let data):
                decodableManager?.decodeOne(data: data, completion: completion)
            case .failure(let error):
                if let apiError = error as? APIError, apiError == .NotFound {
                    completion(.success(nil))
                } else {
                    completion(.failure(error))
                }
            }
        }
    }
}

struct ProductsResponse: Codable {
    let products: [Product]
}
