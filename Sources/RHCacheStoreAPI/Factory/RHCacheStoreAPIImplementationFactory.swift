//
//  RHCacheStoreAPIImplementationFactory.swift
//
//
//  Created by Chung Han Hsin on 2024/1/28.
//

import Foundation
import RHCacheStore

public struct RHCacheStoreAPIImplementationFactory: RHCacheStoreAPIImplementationFactoryProtocol  {
    public init() {}
    public func makeCodableStore(with storeURL: URL, expiryTimeInterval: TimeInterval?=nil) -> RHCacheStoreAPIProtocol {
        return CodableStoreImplementation.init(storeURL: storeURL, expiryTimeInterval: expiryTimeInterval)
    }
    
    public func makeActorCodableStore(with storeURL: URL, expiryTimeInterval: TimeInterval?=nil) -> RHActorCacheStoreAPIProtocol {
        ActorCodableStoreImplementation.init(storeURL: storeURL, expiryTimeInterval: expiryTimeInterval)
    }
    
    public func makeActorCodableImageDataStore(with storeURL: URL) -> RHActorImageDataCacheStoreAPIProtocol {
        RHActorImageDataCacheStoreAPIImplemenntation(storeURL: storeURL)
    }
}
