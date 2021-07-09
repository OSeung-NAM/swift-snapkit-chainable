//
//  UITextField+Chainable.swift
//  snapkit-chainable
//
//  Created by 남오승 on 2021/07/09.
//

import UIKit

extension Chain where Origin: UITextField {
    //테두리 스타일
    func borderStyle(_ style: UITextField.BorderStyle) -> Chain {
        origin.borderStyle = style
        return self
    }
    
    //키보드 타입
    func keyboard(type: UIKeyboardType) -> Chain {
        origin.keyboardType = type
        return self
    }
    
    //입력창 보안여부
    func secure(_ enabled: Bool = true) -> Chain {
        origin.isSecureTextEntry = enabled
        return self
    }
}
