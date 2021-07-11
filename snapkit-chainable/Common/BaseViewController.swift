//
//  BaseViewController.swift
//  snapkit-chainable
//
//  Created by 남오승 on 2021/07/09.
//

import UIKit
import RxSwift
import RxCocoa

@objc protocol BaseViewControllerCustomizable {
    @objc optional func setupViews()
    @objc optional func setupBinds()
}

class BaseViewController: UIViewController,BaseViewControllerCustomizable {
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupViews()
        _setupBinds()
    }
    
    private func _setupViews() {
        view.backgroundColor = .white
        (self as BaseViewControllerCustomizable).setupViews?()
    }
    
    private func _setupBinds() {
        let tapper = UITapGestureRecognizer()
        tapper.rx.event.asDriver().drive(onNext:{[weak self] _ in
            self?.view.endEditing(true)
        }).disposed(by: disposeBag)
        view.addGestureRecognizer(tapper)
        (self as BaseViewControllerCustomizable).setupBinds?()
    }
}
