//
//  UIViewControllerExt.swift
//  BreakPoint
//
//  Created by Juan Luque on 2/8/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentDetail(_ viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewController, animated: false, completion: nil)
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
}
