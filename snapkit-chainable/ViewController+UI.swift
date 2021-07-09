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
                maker.width.equalTo(200)
                maker.height.equalTo(200)
                maker.center.equalToSuperview()
            }).origin
    }
}


/*
 UIKit -> SwiftUI 변환
 Xcode Previews 기능
 */
#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct MainVcRepresentble: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<MainVcRepresentble>) {
        print("updateUIView")
    }
    
    func makeUIView(context: Context) -> UIView { ViewController().view }
    
}
@available(iOS 13.0, *)
struct MainVcPreview: PreviewProvider {
    static var previews: some View { Group {
        MainVcRepresentble()
            .previewDevice("iPhone 12 mini")
        
        MainVcRepresentble()
            .previewDevice("iPhone 11 Pro Max")
    } }
}
#endif
 
