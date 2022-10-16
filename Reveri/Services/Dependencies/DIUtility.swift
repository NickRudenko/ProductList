//
//  DIUtility.swift
//  Reveri
//
//  Created by Mykola Rudenko on 15.10.2022.
//

import Foundation
import Hopoate

/// Registers a creation closure for a given service type.
///
/// - Parameters:
///   - service: The type of service that the creation closure returns.
///   - cacheService: Determines whether the result of calling the creator should be cached or not. Defaults to `true`.
///   - creator: The closure that will be executed when resolving a service of the given type.
/// - Returns: The `ServiceRegistration` created during registration. Can be passed to the `remove` function to remove the registration.
@discardableResult
public func register<Service>(service: Service.Type, cacheService: Bool = true, creator: @escaping () -> Service) -> ServiceRegistration<Service> {
    return DependencyContainer.shared.register(service: service, cacheService: cacheService, creator: creator)
}

/// - Parameter serviceType: The service type that we wish to find a service for.
/// - Returns: A service instance that satisfies the given service type. Requesting a service for a service type that has not been registered is considered a programming error and will cause a fatal error.
public func resolve<Service>(_ serviceType: Service.Type) -> Service {
    return DependencyContainer.shared.resolve(serviceType)
}
