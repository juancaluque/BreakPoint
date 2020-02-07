//
//  GroupCell.swift
//  BreakPoint
//
//  Created by Juan Luque on 2/7/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    // MARK: OUTLETS
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescLbl: UILabel!
    @IBOutlet weak var memberCountLbl: UILabel!
    
    
    // MARK: FUNC
    
    func configureCell(title: String, description: String, memberCount: Int) {
        self.groupTitleLbl.text = title
        self.groupDescLbl.text = description
        self.memberCountLbl.text = "\(memberCount)"
    }

}
