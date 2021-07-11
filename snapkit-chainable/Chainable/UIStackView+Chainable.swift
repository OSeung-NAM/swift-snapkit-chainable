//
//  UIStackView+Chainable.swift
//  snapkit-chainable
//
//  Created by 남오승 on 2021/07/09.
//

import UIKit

extension Chain where Origin: UIStackView {
    func axis(_ axis: NSLayoutConstraint.Axis) -> Chain {
        origin.axis = axis
        return self
    }
    
    func spacing(_ space: CGFloat) -> Chain {
        origin.spacing = space
        return self
    }
    
    func alignment(_ alignment: UIStackView.Alignment) -> Chain {
        origin.alignment = alignment
        return self
    }
    
    func distribution(_ distribution: UIStackView.Distribution) -> Chain {
        origin.distribution = distribution
        return self
    }
}

func HStackView() -> Chain<UIStackView> {
    return UIStackView().chain.axis(.horizontal)
}

func VStackView() -> Chain<UIStackView> {
    return UIStackView().chain.axis(.vertical)
}

func Spacer(width: CGFloat = 1, height: CGFloat = 1) -> Chain<UIView> {
    return UIView().chain.constrain { maker in
        maker.width.equalTo(width)
        maker.height.equalTo(height)
    }
}
