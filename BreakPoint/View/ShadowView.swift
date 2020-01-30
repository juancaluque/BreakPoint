//
//  ShadowView.swift
//  BreakPoint
//
//  Created by Juan Luque on 1/30/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.90
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        
        super.awakeFromNib()
    }

}
