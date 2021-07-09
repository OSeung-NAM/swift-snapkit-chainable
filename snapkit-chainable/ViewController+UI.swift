//
//  ViewController+UI.swift
//  snapkit-chainable
//
//  Created by OSeung Nam on 2021/07/09.
//

import UIKit

extension ViewController {
    func setUpViews() {
        headerWrap = UIView().chain
            .add(to: view)
            .background(color: .yellow)
            .constrain({ maker in
                maker.width.equalTo(300)
                maker.height.equalTo(300)
                maker.center.equalToSuperview()
            }).origin
    }
}
