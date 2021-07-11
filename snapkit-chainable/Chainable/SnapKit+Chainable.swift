//
//  SnapKit+Chainable.swift
//  snapkit-chainable
//
//  Created by OSeung Nam on 2021/07/09.
//

import SnapKit
import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIView {
    var didMoveToSuperview: ControlEvent<Void> {
        let event = methodInvoked(#selector(Base.didMoveToSuperview)).map { _ in }
        return ControlEvent(events: event)
    }
}

extension Chain where Origin: UIView {
    func constrain(_ maker: @escaping (ConstraintMaker) -> Void) -> Chain {
        if let _ = origin.superview {
            origin.snp.makeConstraints(maker)
        }else {
            _ = origin.rx.didMoveToSuperview
                .take(1)
                .subscribe(onNext:{ [weak self] _ in
                    self?.origin.snp.makeConstraints(maker)
                })
        }
        
        return self
    }
    
    func updateConstrain(_ maker: @escaping (ConstraintMaker) -> Void) -> Chain {
        if let _ = origin.superview {
            origin.snp.updateConstraints(maker)
        }else {
            _ = origin.rx.didMoveToSuperview
                .take(1)
                .subscribe(onNext:{ [weak self] _ in
                    self?.origin.snp.updateConstraints(maker)
                })
        }
        return self
    }
}
