//
//  ReveriApp.swift
//  Reveri
//
//  Created by Mykola Rudenko on 14.10.2022.
//

import SwiftUI
import Hopoate

@main
struct ReveriApp: App {
    
    init() {
        registerDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            ProductsListView(viewModel: ProductsListViewModel(productContext: ProductSearchContext(networkManager: resolve(NetworkManaging.self), decodableManager: resolve(DecodableManaging.self))))
        }
    }
    
    private func registerDependencies() {
        register(service: NetworkManaging.self, creator: NetworkManager.init)
        register(service: DecodableManaging.self, creator: DecodableManager.init)
    }
}
