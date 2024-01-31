//
//  RHCacheStoreAPIImplementationFactoryProtocol.swift
//
//
//  Created by Chung Han Hsin on 2024/1/28.
//

import Foundation

public protocol RHCacheStoreAPIImplementationFactoryProtocol {
    func makeCodableStore(with storeURL: URL, expiryTimeInterval: TimeInterval?) -> RHCacheStoreAPIProtocol
    func makeActorCodableStore(with storeURL: URL, expiryTimeInterval: TimeInterval?) -> RHActorCacheStoreAPIProtocol
}

