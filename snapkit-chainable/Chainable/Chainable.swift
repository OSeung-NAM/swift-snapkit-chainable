//
//  Chainable.swift
//  snapkit-chainable
//
//  Created by OSeung Nam on 2021/07/09.
//

import Foundation

class Chain<Origin> {
    var origin: Origin
    
    init(origin: Origin) {
        self.origin = origin
    }
}

protocol Chainable {}

extension Chainable {
    var chain: Chain<Self> {
        return Chain(origin: self)
    }
}
