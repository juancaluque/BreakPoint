//
//  GroupFeedCell.swift
//  BreakPoint
//
//  Created by Juan Luque on 2/7/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    //MARK: OUTLETS
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    
    //MARK: FUNC
    
    func configureCell(profileImage: UIImage, email: String, content: String ) {
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
    
    
    
    
    
    
    

}
