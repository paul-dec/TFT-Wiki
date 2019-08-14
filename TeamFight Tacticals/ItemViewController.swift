//
//  ItemViewController.swift
//  TeamFight Tacticals
//
//  Created by Paul Decrosse on 25/06/2019.
//  Copyright © 2019 tchouki. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let name = ["Infinity Edge", "Sword of the Divine", "Hextech Gunblade", "Spear of Shojin", "Guardian Angel", "The Bloodthirster", "Zeke's Herald", "Youmuu's Ghostblade", "Rapid Firecannon", "Guinsoo's Rageblade", "Statikk Shiv", "Phantom Dancer", "Dervish Blade", "Titanic Hydra", "Blade of the Ruined King", "Locket of the Iron Solari", "Frozen Heart", "Thornmail", "Atma's Reckoning", "Warrior", "Knight's Vow", "Zeal and Sheen", "Zephyr", "Runaan's Hurricane", "Rabadon's Deathcap", "Luden's Echo", "Pox Arcana", "Seraph's Embrace", "Redemption", "Warmog's Armor", "Frozen Mallet"]
    
    var sub: [[String]] = [["B.F.Sword", "B.F.Sword"], ["B.F.Sword", "Recurve Bow"], ["B.F.Sword", "Needl.Large Rod"], ["B.F.Sword", "Tear of the Goddess"], ["B.F.Sword", "Chain Vest"], ["B.F.Sword", "Negatron Cloak"], ["B.F.Sword", "Giant's Belt"], ["B.F.Sword", "Spatula"], ["Recurve Bow", "Recurve Bow"], ["Recurve Bow", "Needl.Large Rod"], ["Recurve Bow", "Tear of the Goddess"], ["Recurve Bow", "Chain Vest"], ["Recurve Bow", "Negatron Cloak"], ["Recurve Bow", "Giant's Belt"], ["Recurve Bow", "Spatula"], ["Chain Vest", "Needl.Large Rod"], ["Chain Vest", "Tear of the Goddess"], ["Chain Vest", "Chain Vest"], ["Chain Vest", "Negatron Cloak"], ["Chain Vest", "Giant's Belt"], ["Chain Vest", "Spatula"], ["Negatron Cloak", "Needl.Large Rod"], ["Negatron Cloak", "Tear of the Goddess"], ["Negatron Cloak", "Negatron Cloak"], ["Negatron Cloak", "Giant's Belt"], ["Negatron Cloak", "Spatula"], ["Needl.Large Rod", "Needl.Large Rod"], ["Needl.Large Rod", "Giant's Belt"], ["Needl.Large Rod", "Spatula"], ["Tear of the Goddess", "Tear of the Goddess"], ["Tear of the Goddess", "Giant's Belt"], ["Tear of the Goddess", "Spatula"], ["Giant's Belt", "Giant's Belt"], ["Giant's Belt", "Spatula"], ["Spatula", "Spatula"]]
    
    var items: [Item] = [Item]()
    
    func setup_item() {
        var j = 0
        for i in name {
            print(i, sub[j])
            items.append(Item(sub[j], i))
            j += 1
        }
    }
    
    let itemCellReuseIdentifier = "itemcell"
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var GoogleBannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup_item()
        GoogleBannerView.adUnitID = "ca-app-pub-9255058538010369/7241313232"
        //TEST CODE GoogleBannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        GoogleBannerView.rootViewController = self
        GoogleBannerView.load(GADRequest())
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(items.count)
        return self.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell:ItemCell = self.tableView.dequeueReusableCell(withIdentifier: itemCellReuseIdentifier) as! ItemCell
        cell.myItemLabel.text = items[indexPath.row].getName()
        cell.myItemImage.image = UIImage(named: items[indexPath.row].getName())
        cell.item1.image = UIImage(named: items[indexPath.row].getSub()[0])
        cell.item2.image = UIImage(named: items[indexPath.row].getSub()[1])

        return cell
    }
    
}

