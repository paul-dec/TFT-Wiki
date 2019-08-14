//
//  Champion.swift
//  TeamFight Tacticals
//
//  Created by Paul Decrosse on 24/06/2019.
//  Copyright © 2019 tchouki. All rights reserved.
//

class Champion {
    private var name: String = ""
    private var type: [String] = []
    
    init(_ type: [String], _ name: String) {
        self.name = name
        self.type = type
    }

    func getName() -> String {
        return self.name
    }
    
    func getClass() -> [String] {
        return self.type
    }
    
}
