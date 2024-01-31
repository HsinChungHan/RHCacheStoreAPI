//
//  RHActorImageDataCacheStoreAPIImplemenntation.swift
//
//
//  Created by Chung Han Hsin on 2024/1/31.
//

import Foundation
import RHCacheStore

actor RHActorImageDataCacheStoreAPIImplemenntation: RHActorImageDataCacheStoreAPIProtocol {
    let storeURL: URL
    lazy var store = makeStore()
    init(storeURL: URL) {
        self.storeURL = storeURL
    }
    
    func insert(with id: String, imageData: Data) async throws {
        try await store.insert(with: id, imageData: imageData)
    }
    
    func retrieve(with id: String) async -> RHCacheStore.RetrieveImageDataCacheResult {
        await store.retrieve(with: id)
    }
    
    func delete(with id: String) async throws {
        try await store.delete(with: id)
    }
    
    func saveCache() async throws {
        try await store.saveCache()
    }
    
    func loadCache() async throws {
        try await store.loadCache()
    }
}

private extension RHActorImageDataCacheStoreAPIImplemenntation {
    func makeStore() -> ActorImageDataCacheStore {
        let store = ActorCodableImageStore(storeURL: storeURL)
        return store
    }
}
