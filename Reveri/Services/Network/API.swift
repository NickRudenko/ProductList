//
//  API.swift
//  Reveri
//
//  Created by Mykola Rudenko on 15.10.2022.
//

import Foundation
import Moya

enum API: TargetType {

    case productsForPage(Int)

    var baseURL: URL {
        EnvironmentConfiguration.baseAPIUrl
    }

    var path: String {
        switch self {
        case .productsForPage:
            return "products"
        }
    }

    var method: Moya.Method {
        switch self {
        case .productsForPage:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .productsForPage(page):
            // TODO: specify limit based on page
            return .requestParameters(parameters: ["limit": "10"], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        nil
    }
    
}
