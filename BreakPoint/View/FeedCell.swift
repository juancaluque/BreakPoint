//
//  FeedCell.swift
//  BreakPoint
//
//  Created by Juan Luque on 2/3/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    // OUTLETS
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profileImg.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
}
