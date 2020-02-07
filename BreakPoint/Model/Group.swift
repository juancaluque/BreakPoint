//
//  Group.swift
//  BreakPoint
//
//  Created by Juan Luque on 2/7/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import Foundation

class Group {
    
    private var _groupTitle: String
    private var _groupDesc: String
    private var _key: String
    private var _memberCount: Int
    private var _members: [String]
    
    public var groupTitle: String {
        return _groupTitle
    }
    public var groupDesc: String{
        return _groupDesc
    }
    public var key: String {
        return _key
    }
    public var memeberCount: Int {
        return _memberCount
    }
    public var member: [String] {
        return _members
    }
    
    init(title: String, description: String, key: String, members: [String], memberCount: Int) {
        self._groupTitle = title
        self._groupDesc = description
        self._key = key
        self._members = members
        self._memberCount = memberCount
    }
    
}
