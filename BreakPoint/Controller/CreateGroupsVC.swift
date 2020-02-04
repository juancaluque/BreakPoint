//
//  CreateGroupsVC.swift
//  BreakPoint
//
//  Created by Juan Luque on 2/4/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {

    // OUTLETS
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var addPplLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // @IBACTIONS
    @IBAction func doneBtnWasPressed(_ sender: Any) {
    }
    @IBAction func closeBtnWasPressed(_ sender: Any) {
    }
    
}
