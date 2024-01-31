//
//  RHActorCacheStoreAPIProtocol.swift
//
//
//  Created by Chung Han Hsin on 2024/1/31.
//

import Foundation
import RHCacheStore

public protocol RHActorCacheStoreAPIProtocol {
    var expiryTimeInterval: TimeInterval? { get }
    func delete(with id: String) async throws
    func insert(with id: String, json: Any) async throws
    func retrieve(with id: String) async -> RetriveCacheResult
}
