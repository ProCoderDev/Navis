//
//  Configurable.swift of Navigattie
//
//  Created by Eugene Babenko

// 
//  Copyright ©2023 eugene. Licensed under MIT License. 
public protocol Configurable {}
extension Configurable {
    func changing<T>(path: WritableKeyPath<Self, T>, to value: T) -> Self {
        var clone = self
        clone[keyPath: path] = value
        return clone
    }
}
