//
//  UIStackView+Chainable.swift
//  snapkit-chainable
//
//  Created by 남오승 on 2021/07/09.
//

import UIKit

extension Chain where Origin: UIStackView {
    //StackView의 가로, 세로 형태세팅
    func axis(_ axis: NSLayoutConstraint.Axis) -> Chain {
        origin.axis = axis
        return self
    }
    
    //StackView안의 View들간의 간격
    func spacing(_ space: CGFloat) -> Chain {
        origin.spacing = space
        return self
    }
    
    //StackView안 View들에 대한 Y축 정렬
    func alignment(_ alignment: UIStackView.Alignment) -> Chain {
        origin.alignment = alignment
        return self
    }
    
    //StackView안 View들에 대한 X축 정렬
    func distribution(_ distribution: UIStackView.Distribution) -> Chain {
        origin.distribution = distribution
        return self
    }
}

//수평 StackView
func HStackView() -> Chain<UIStackView> {
    return UIStackView().chain.axis(.horizontal)
}

//수직 StackView
func VStackView() -> Chain<UIStackView> {
    return UIStackView().chain.axis(.vertical)
}

//StackView 공간 세팅
func Spacer(width: CGFloat = 1, height: CGFloat = 1) -> Chain<UIView> {
    return UIView().chain.constrain { maker in
        maker.width.equalTo(width)
        maker.height.equalTo(height)
    }
}
