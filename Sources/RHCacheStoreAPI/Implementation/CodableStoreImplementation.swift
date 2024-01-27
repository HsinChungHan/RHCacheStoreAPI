//
//  CodableStoreImplementation.swift
//
//
//  Created by Chung Han Hsin on 2024/1/28.
//

import Foundation
import RHCacheStore

class CodableStoreImplementation: RHCacheStoreAPIProtocol {
    let storeURL: URL
    var expiryTimeInterval: TimeInterval?
    init(storeURL: URL, expiryTimeInterval: TimeInterval? = nil) {
        self.storeURL = storeURL
        self.expiryTimeInterval = expiryTimeInterval
    }
    
    func delete(with id: String, completion: @escaping (Result<Void, CacheStoreError>) -> Void) {
        store.delete(with: id, completion: completion)
    }
    
    func insert(with id: String, data: Data, completion: @escaping (Result<Void, CacheStoreError>) -> Void) {
        store.insert(with: id, data: data, completion: completion)
    }
    
    func retrieve(with id: String, completion: @escaping (Result<Data, CacheStoreError>) -> Void) {
        store.retrieve(with: id, completion: completion)
    }
}

// MARK: - Conputed Properties
extension CodableStoreImplementation {
    var store: CacheStore {
        guard let expiryTimeInterval else {
            return CodableCacheStore.init(storeURL: storeURL)
        }
        return CodableCacheStoreWithExpiry(expiryTimeInterval: expiryTimeInterval, storeURL: storeURL)
    }
}
