//
//  Item.swift
//  TeamFight Tacticals
//
//  Created by Paul Decrosse on 25/06/2019.
//  Copyright © 2019 tchouki. All rights reserved.
//

class Item {
    private var name: String = ""
    private var sub: [String] = []
    
    init(_ type: [String], _ name: String) {
        self.name = name
        self.sub = type
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getSub() -> [String] {
        return self.sub
    }
}
