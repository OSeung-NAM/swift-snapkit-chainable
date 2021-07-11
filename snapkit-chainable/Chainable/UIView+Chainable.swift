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
    
    private func add(child: UIView, to parent: UIView) {
        if let stackParent = parent as? UIStackView {
            stackParent.addArrangedSubview(child)
        }else {
            parent.addSubview(child)
        }
    }
    
    func add<PARENT: UIView>(to parent: PARENT) -> Chain {
        add(child: origin, to: parent)
        return self
    }
    
    func add<V: UIView>(to parentChain: Chain<V>) -> Chain {
        return add(to: parentChain.origin)
    }
    
    func add<V: UIView>(child: V) -> Chain {
        add(child: origin, to: origin)
        return self
    }
    
    func add<V: UIView>(child: Chain<V>) -> Chain {
        return add(child: child.origin)
    }
    
    func add<V: UIView>(children: V...) -> Chain {
        children.forEach{ child in add(child: child, to: origin ) }
        return self
    }
    
    func add<V: UIView>(children: Chain<V>...) -> Chain {
        children.map { $0.origin }.forEach { child in add(child: child, to: origin)}
        return self
    }
    
    func apply(_ block: (Origin) -> Void) -> Chain {
        block(origin)
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

