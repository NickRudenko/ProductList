//
//  Codable.swift
//  Reveri
//
//  Created by Mykola Rudenko on 15.10.2022.
//

import Foundation

protocol DecodableManaging {
    func decodeMany<T: Decodable>(
        data: Data,
        completion: (Result<[T], Error>) -> Void
    )

    func decodeOne<T: Decodable>(
        data: Data,
        completion: (Result<T, Error>) -> Void
    )
}

struct FailableDecodable<Base : Decodable> : Decodable {

    let base: Base?

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.base = try? container.decode(Base.self)
    }
}


struct DecodableManager: DecodableManaging {
    func decodeMany<T: Decodable>(
        data: Data,
        completion: (Result<[T], Error>) -> Void
    ) {
        do {
            let results = try JSONDecoder().decode([FailableDecodable<T>].self, from: data).compactMap { $0.base }
            completion(.success(results))
        } catch let error {
            completion(.failure(CodableError.dataDecodeError(description: error.localizedDescription)))
        }
    }

    func decodeOne<T: Decodable>(
        data: Data,
        completion: (Result<T, Error>) -> Void
    ) {
        do {
            let results = try JSONDecoder().decode(T.self, from: data)
            completion(.success(results))
        } catch {
            completion(.failure(CodableError.dataDecodeError(description: error.localizedDescription)))
        }
    }
}
