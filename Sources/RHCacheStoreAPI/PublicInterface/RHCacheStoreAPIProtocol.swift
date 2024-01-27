//
//  RHCacheStoreAPIProtocol.swift
//
//
//  Created by Chung Han Hsin on 2024/1/28.
//

import Foundation
import RHCacheStore

public protocol RHCacheStoreAPIProtocol {
    var expiryTimeInterval: TimeInterval? { get }
    func delete(with id: String, completion: @escaping (Result<Void, CacheStoreError>) -> Void)
    func insert(with id: String, data: Data, completion: @escaping (Result<Void, CacheStoreError>) -> Void)
    func retrieve(with id: String, completion: @escaping (Result<Data, CacheStoreError>) -> Void)
}
