//
//  NetworkManager.swift
//  Reveri
//
//  Created by Mykola Rudenko on 15.10.2022.
//

import Foundation
import Moya

protocol NetworkManaging {
    func executeRequst<T: TargetType>(
        provider: MoyaProvider<T>,
        apiCall: T,
        completion: @escaping (Result<Data, Error>) -> Void
    )
}

struct NetworkManager: NetworkManaging {
    func executeRequst<T: TargetType>(
        provider: MoyaProvider<T>,
        apiCall: T,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        provider.request(apiCall) { result in

            do {
                let response = try result.get()
                let responseStatus = try validateResponseStatus(response: response)
                try handlerResponseStatus(status: responseStatus)

                completion(.success(response.data))
            } catch let error {
                completion(.failure(error))
            }
        }
    }

    private func handlerResponseStatus(status: ResponseStatus) throws{
        switch status {
        case .OK, .NoContent:
            return
        case .BAD_REQUEST:
            throw APIError.BadRequest
        case .NOT_FOUND:
            throw APIError.NotFound
        case .NotAcceptable:
            throw APIError.NotAcceptable
        case .UnprocessableEntity:
            throw APIError.UnprocessableEntity
        case .Locked, .Forbidden:
            throw APIError.Locked
        }
    }

    private func validateResponseStatus(response: Response) throws -> ResponseStatus {
        print("ResponseStatus: \(response.statusCode))")
        guard let status = ResponseStatus(rawValue: response.statusCode) else {
            throw APIError.Unexpected
        }
        return status
    }
}
