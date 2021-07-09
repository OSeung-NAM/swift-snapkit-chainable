//
//  UIButton+Chainable.swift
//  snapkit-chainable
//
//  Created by 남오승 on 2021/07/09.
//

import UIKit

extension Chain where Origin: UIButton {
    func title(_ text: String, for state: UIControl.State = .normal) -> Chain {
        origin.setTitle(text, for: state)
        return self
    }
    
    func titleColor(_ color: UIColor, for state: UIControl.State = .normal) -> Chain {
        origin.setTitleColor(color, for: state)
        return self
    }
}
