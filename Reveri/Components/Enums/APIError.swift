//
//  APIError.swift
//  Reveri
//
//  Created by Mykola Rudenko on 15.10.2022.
//

import Foundation

protocol ApplicationError {
    func local() -> String
}

enum CodableError: Error, ApplicationError {
    case dataDecodeError(description: String)

    func local() -> String {
        switch self {
        case .dataDecodeError(let description):
            return description
        }
    }
}

enum APIError: Error, ApplicationError {
    case NoInternetConnection
    case ServerUnavailable
    case ServerTimeout
    case Unexpected
    case BadRequest
    case NotFound
    case NotAcceptable
    case UnprocessableEntity
    case Locked

    func local() -> String {
        switch self {
        case .NoInternetConnection:
            return "No internet connection"
        case .ServerUnavailable:
            return "Server unavailable"
        case .ServerTimeout:
            return "Server timeout. Try again later"
        case .Unexpected:
            return "Something wrong. Try again later"
        case .BadRequest:
            return "Something wrong. Try again later"
        case .NotFound:
            return "Not found"
        case .NotAcceptable:
            return "Something wrong. Try again later"
        case .UnprocessableEntity:
            return "Something wrong. Try again later"
        case .Locked:
            return "Something wrong. Try again later"
        }
    }
}
