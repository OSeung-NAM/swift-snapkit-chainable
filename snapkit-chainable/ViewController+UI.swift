//
//  ViewController+UI.swift
//  snapkit-chainable
//
//  Created by OSeung Nam on 2021/07/09.
//

import UIKit

extension ViewController {
    func setupViews() {
         _ = UIView().chain
            .add(to: view)
            .background(color: .blue)
            .constrain { make in
                make.size.equalTo(100)
                make.centerX.equalToSuperview()
                make.top.equalTo(self.view.safeAreaLayoutGuide)
            }
            .add(children:
                    UIView().chain
                    .background(color: .yellow)
                    .constrain({ make in
                        make.size.equalTo(50)
                        make.center.equalToSuperview()
                    })
                 ,
                 UIView().chain
                    .background(color: .brown)
                    .constrain({ make in
                        make.size.equalTo(20)
                        make.center.equalToSuperview()
                    })
            )
            .origin
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

