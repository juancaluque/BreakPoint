//
//  UserCell.swift
//  BreakPoint
//
//  Created by Juan Luque on 2/5/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    // OUTLETS
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    var showing = false

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            if showing == false {
                checkImage.isHidden = false
                showing = true
            } else {
                checkImage.isHidden = true
                showing = false
            }
        }
    }
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        self.profileImage.image = image
        self.emailLbl.text = email
        if isSelected {
            checkImage.isHidden = false
            showing = true
        } else {
            checkImage.isHidden = true
            showing = false
        }
    }
}
