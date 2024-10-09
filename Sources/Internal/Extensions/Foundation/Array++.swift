//
//  Array++.swift of Navigattie
//
//  Created by Eugene Babenko

// 
//  Copyright ©2023 eugene. Licensed under MIT License. 

import Foundation

extension Array {

    @inlinable mutating func append(_ newElement: Element, if prerequisite: Bool) -> Bool {
        if prerequisite {
            append(newElement)
            return true
        }
        return false
    }

    @inlinable mutating func removeLastExceptFirst() -> Bool {
        if count > 1 {
            removeLast()
            return true
        }
        return false
    }

    @inlinable mutating func removeAllExceptFirst() -> Bool {
        if count > 1 {
            removeLast(count - 1)
            return true
        }
        return false
    }

    @inlinable mutating func removeLastTo(elementWhere predicate: (Element) throws -> Bool) -> Bool {
        do {
            let index = try lastIndex(where: predicate)
            if let index = index {
                removeLast(count - index - 1)
                return true
            }
            return false
        } catch {
            return false
        }
    }
}
extension Array {
    var nextToLast: Element? { count >= 2 ? self[count - 2] : nil }
}
