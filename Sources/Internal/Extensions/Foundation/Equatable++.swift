//
//  Equatable++.swift of Navigattie
//
//  Created by Eugene Babenko

// 
//  Copyright ©2023 eugene. Licensed under MIT License. 

import Foundation

extension Equatable {
    func isOne(of other: Self?...) -> Bool { other.contains(self) }
}
