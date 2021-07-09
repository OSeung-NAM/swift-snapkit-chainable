//
//  UIView+Chainable.swift
//  snapkit-chainable
//
//  Created by OSeung Nam on 2021/07/09.
//

import UIKit

extension UIView: Chainable {}

extension Chain where Origin: UIView {
    func background(color: UIColor) -> Chain {
        origin.backgroundColor = color
        return self
    }
    
    func cornerRadius(_ r: CGFloat) -> Chain {
        origin.layer.cornerRadius = r
        origin.clipsToBounds = true
        return self
    }
    
    func add(to parent: UIView) -> Chain {
        parent.addSubview(origin)
        return self
    }
    
    func size(width: CGFloat, height: CGFloat) -> Chain {
        origin.translatesAutoresizingMaskIntoConstraints = true
        origin.widthAnchor.constraint(equalToConstant: width).isActive = true
        origin.heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    func size(_ size: CGSize) -> Chain {
        return self.size(width: size.width, height: size.height)
    }
}
