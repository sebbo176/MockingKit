//
//  Mockable+Register.swift
//  MockingKit
//
//  Created by Daniel Saidi on 2019-11-25.
//  Copyright © 2019-2025 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Mockable {
    
    /// Register a result value for a mock reference.
    ///
    /// - Parameters:
    ///   - ref: The mock reference to register a result for.
    ///   - result: What to return when the function is called.
    func registerResult<Arguments, Result>(
        for ref: MockReference<Arguments, Result>,
        result: @escaping (Arguments) throws -> Result
    ) {
        updateRegistrations {
            mock.registeredResults.updateValue(result, forKey: ref.id)
        }
    }

    /// Register a result value for a mock reference.
    ///
    /// - Parameters:
    ///   - refKeyPath: A key path to the mock reference to register a result for.
    ///   - result: What to return when the function is called.
    func registerResult<Arguments, Result>(
        for refKeyPath: KeyPath<Self, MockReference<Arguments, Result>>,
        result: @escaping (Arguments) throws -> Result
    ) {
        registerResult(for: self[keyPath: refKeyPath], result: result)
    }

    /// Register a result value for an async mock reference.
    ///
    /// - Parameters:
    ///   - ref: The mock reference to register a result for.
    ///   - result: What to return when the function is called.
    func registerResult<Arguments, Result>(
        for ref: AsyncMockReference<Arguments, Result>,
        result: @escaping (Arguments) async throws -> Result
    ) {
        updateRegistrations {
            mock.registeredResults.updateValue(result, forKey: ref.id)
        }
    }

    /// Register a result value for an async mock reference.
    /// 
    /// - Parameters:
    ///   - refKeyPath: A key path to the mock reference to register a result for.
    ///   - result: What to return when the function is called.
    func registerResult<Arguments, Result>(
        for refKeyPath: KeyPath<Self, AsyncMockReference<Arguments, Result>>,
        result: @escaping (Arguments) async throws -> Result
    ) {
        registerResult(for: self[keyPath: refKeyPath], result: result)
    }

    /// Register a result value for a throwing mock reference.
    ///
    /// - Parameters:
    ///   - ref: The mock reference to register a result for.
    ///   - result: What to return when the function is called.
    func registerResult<Arguments, Result>(
        for ref: ThrowingMockReference<Arguments, Result>,
        result: @escaping (Arguments) throws -> Result
    ) {
        updateRegistrations {
            mock.registeredResults.updateValue(result, forKey: ref.id)
        }
    }

    /// Register a result value for a throwing mock reference.
    ///
    /// - Parameters:
    ///   - refKeyPath: A key path to the mock reference to register a result for.
    ///   - result: What to return when the function is called.
    func registerResult<Arguments, Result>(
        for refKeyPath: KeyPath<Self, ThrowingMockReference<Arguments, Result>>,
        result: @escaping (Arguments) throws -> Result
    ) {
        registerResult(for: self[keyPath: refKeyPath], result: result)
    }

    /// Register a result value for an async throwing mock reference.
    ///
    /// - Parameters:
    ///   - ref: The mock reference to register a result for.
    ///   - result: What to return when the function is called.
    func registerResult<Arguments, Result>(
        for ref: AsyncThrowingMockReference<Arguments, Result>,
        result: @escaping (Arguments) async throws -> Result
    ) {
        updateRegistrations {
            mock.registeredResults.updateValue(result, forKey: ref.id)
        }
    }

    /// Register a result value for an async throwing mock reference.
    ///
    /// - Parameters:
    ///   - refKeyPath: A key path to the mock reference to register a result for.
    ///   - result: What to return when the function is called.
    func registerResult<Arguments, Result>(
        for refKeyPath: KeyPath<Self, AsyncThrowingMockReference<Arguments, Result>>,
        result: @escaping (Arguments) async throws -> Result
    ) {
        registerResult(for: self[keyPath: refKeyPath], result: result)
    }

    /// Register an error to be thrown for a throwing mock reference.
    ///
    /// - Parameters:
    ///   - ref: The mock reference to register an error for.
    ///   - error: The error to throw when the function is called.
    func registerError<Arguments, Result>(
        for ref: ThrowingMockReference<Arguments, Result>,
        error: Error
    ) {
        updateRegistrations {
            mock.registeredErrors[ref.id] = error
            return mock.registeredResults.updateValue({ (_: Arguments) throws -> Result in
                throw error
            }, forKey: ref.id)
        }
    }

    /// Register an error to be thrown for a throwing mock reference.
    ///
    /// - Parameters:
    ///   - refKeyPath: A key path to the mock reference to register an error for.
    ///   - error: The error to throw when the function is called.
    func registerError<Arguments, Result>(
        for refKeyPath: KeyPath<Self, ThrowingMockReference<Arguments, Result>>,
        error: Error
    ) {
        registerError(for: self[keyPath: refKeyPath], error: error)
    }

    /// Register an error to be thrown for an async throwing mock reference.
    ///
    /// - Parameters:
    ///   - ref: The mock reference to register an error for.
    ///   - error: The error to throw when the function is called.
    func registerError<Arguments, Result>(
        for ref: AsyncThrowingMockReference<Arguments, Result>,
        error: Error
    ) {
        updateRegistrations {
            mock.registeredErrors[ref.id] = error
            return mock.registeredResults.updateValue({ (_: Arguments) async throws -> Result in
                throw error
            }, forKey: ref.id)
        }
    }

    /// Register an error to be thrown for an async throwing mock reference.
    ///
    /// - Parameters:
    ///   - refKeyPath: A key path to the mock reference to register an error for.
    ///   - error: The error to throw when the function is called.
    func registerError<Arguments, Result>(
        for refKeyPath: KeyPath<Self, AsyncThrowingMockReference<Arguments, Result>>,
        error: Error
    ) {
        registerError(for: self[keyPath: refKeyPath], error: error)
    }
}
