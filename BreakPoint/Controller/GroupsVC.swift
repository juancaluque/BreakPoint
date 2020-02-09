//
//  SecondViewController.swift
//  BreakPoint
//
//  Created by Juan Luque on 1/29/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {

    // MARK: OUTLETS
    @IBOutlet weak var groupsTableView: UITableView!
    
    //MARK: VARIABLES
    
    var groupsArray = [Group]()
    
    //MARK: LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupsTableView.delegate = self
        groupsTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instace.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instace.getAllGroups { (returnedGroupsArray) in
                self.groupsArray = returnedGroupsArray
                self.groupsTableView.reloadData()
            }
        }
    }
    
    
    
    

    // MARK: @IBACTIONS
}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: TABLE VIEW
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = groupsTableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell else { return UITableViewCell() }
        let group = groupsArray[indexPath.row]
        
        cell.configureCell(title: group.groupTitle, description: group.groupDesc, memberCount: group.memeberCount)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupFeedVC = storyboard?.instantiateViewController(identifier: "GroupFeedVC") as? GroupFeedVC else { return }
        groupFeedVC.initData(forGroup: groupsArray[indexPath.row])
        presentDetail(groupFeedVC)
    }
}

