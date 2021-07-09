//
//  SnapKit+Chainable.swift
//  snapkit-chainable
//
//  Created by OSeung Nam on 2021/07/09.
//

import SnapKit
import UIKit

extension Chain where Origin: UIView {
    func constrain(_ maker: (ConstraintMaker) -> Void) -> Chain {
        origin.snp.makeConstraints(maker)
        return self
    }
    
    func updateConstrain(_ maker: (ConstraintMaker) -> Void) -> Chain {
        origin.snp.updateConstraints(maker)
        return self
    }
}
