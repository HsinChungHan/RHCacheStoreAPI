//
//  ActorCodableStoreImplementation.swift
//
//
//  Created by Chung Han Hsin on 2024/1/31.
//

import Foundation
import RHCacheStore

class ActorCodableStoreImplementation: RHActorCacheStoreAPIProtocol {
    private lazy var store = makeStore()
    
    private let storeURL: URL
    var expiryTimeInterval: TimeInterval?
    init(storeURL: URL, expiryTimeInterval: TimeInterval? = nil) {
        self.storeURL = storeURL
        self.expiryTimeInterval = expiryTimeInterval
    }
    
    func delete(with id: String) async throws {
        try await store.delete(with: id)
    }
    
    func insert(with id: String, json: Any) async throws {
        try await store.insert(with: id, json: json)
    }
    
    func retrieve(with id: String) async -> RHCacheStore.RetriveCacheResult {
        await store.retrieve(with: id)
    }
    
    func saveCache() async throws {
        try await store.saveCache()
    }
    
    func loadCache() async throws {
        try await store.loadCache()
    }
}

// MARK: - Factory methods
private extension ActorCodableStoreImplementation {
    func makeStore() -> ActorCacheStore{
        guard let expiryTimeInterval else {
            return ActorCodableCacheStore.init(storeURL: storeURL)
        }
        return ActorCodableCacheStoreWithExpiry(expiryTimeInterval: expiryTimeInterval, storeURL: storeURL)
    }
}
