//
//  ViewController.swift
//  TeamFight Tacticals
//
//  Created by Paul Decrosse on 24/06/2019.
//  Copyright © 2019 tchouki. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let name = ["Varus", "Morgana", "Aatrox", "Swain", "Elise", "Evelynn", "Brand", "Shyvana", "Aurelion Sol", "Yasuo", "Braum", "Ashe", "Sejuani", "Lissandra", "Volibear", "Anivia", "Blitzcrank", "Darius", "Draven", "Katarina", "Fiora", "Vayne", "Leona", "Garen", "Lucian", "Kayle", "Shen", "Kennen", "Zed", "Akali", "Graves", "Gangplank", "Pyke", "Miss Fortune", "Mordekaiser", "Karthus", "Kindred", "Warwick", "Ahri", "Gnar", "Nidalee", "Rengar", "Kha'Zix", "Rek'Sai", "Kassadin", "Cho'Gath", "Tristana", "Poppy", "Lulu", "Veigar"]
    
    var type: [[String]] = [["Demon", "Ranger"], ["Demon", "Sorcerer"], ["Demon", "Blademaster"], ["Demon", "Imperial", "Shapeshifter"], ["Demon", "Shapeshifter"], ["Demon", "Assassin"], ["Demon", "Elementalist"], ["Dragon", "Shapeshifter"], ["Dragon", "Sorcerer"], ["Exile", "Blademaster"], ["Glacial", "Guardian"], ["Glacial", "Ranger"], ["Glacial", "Knight"], ["Glacial", "Elementalist"], ["Glacial", "Brawler"], ["Glacial", "Elementalist"], ["Robot", "Brawler"], ["Imperial", "Knight"], ["Imperial", "Blademaster"], ["Imperial", "Assassin"], ["Noble", "Blademaster"], ["Noble", "Ranger"], ["Noble", "Guardian"], ["Noble", "Knight"], ["Noble", "Gunslinger"], ["Noble", "Knight"], ["Ninja", "Blademaster"], ["Ninja", "Elementalist", "Yordle"], ["Ninja", "Assassin"], ["Ninja", "Assassin"], ["Pirate", "Gunslinger"], ["Pirate", "Gunslinger"], ["Pirate", "Assassin"], ["Pirate", "Gunslinger"], ["Phantom", "Knight"], ["Phantom", "Sorcerer"], ["Phantom", "Ranger"], ["Wild", "Brawler"], ["Wild", "Sorcerer"], ["Wild", "Yordle", "Shapeshifter"], ["Wild", "Shapeshifter"], ["Wild", "Assassin"], ["Void", "Assassin"], ["Void", "Brawler"], ["Void", "Sorcerer"], ["Void", "Brawler"], ["Yordle", "Gunslinger"], ["Yordle", "Knight"], ["Yordle", "Sorcerer"], ["Yordle", "Sorcerer"]]

    var champions: [Champion] = [Champion]()

    func setup_champion() {
        var j = 0
        for i in type {
            print(i, name[j])
            champions.append(Champion(i, name[j]))
            j += 1
        }
    }
        
    let cellReuseIdentifier = "cell"
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var GoogleBannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup_champion()
        GoogleBannerView.adUnitID = "ca-app-pub-9255058538010369/7241313232"
        //TEST CODE GoogleBannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        GoogleBannerView.rootViewController = self
        GoogleBannerView.load(GADRequest())
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(champions.count)
        return self.champions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell:MyCustomCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! MyCustomCell

        cell.myCellLabel.text = champions[indexPath.row].getName()
        cell.myImage.image = UIImage(named: champions[indexPath.row].getName())
        if champions[indexPath.row].getClass().count == 1 {
            cell.type1.image = UIImage(named: champions[indexPath.row].getClass()[0])
            cell.type2.image = UIImage(named: "Notype")
            cell.type3.image = UIImage(named: "Notype")
        } else if champions[indexPath.row].getClass().count == 2 {
            cell.type1.image = UIImage(named: champions[indexPath.row].getClass()[0])
            cell.type2.image = UIImage(named: champions[indexPath.row].getClass()[1])
            cell.type3.image = UIImage(named: "Notype")
        } else {
            cell.type1.image = UIImage(named: champions[indexPath.row].getClass()[0])
            cell.type2.image = UIImage(named: champions[indexPath.row].getClass()[1])
            cell.type3.image = UIImage(named: champions[indexPath.row].getClass()[2])
        }

        return cell
    }

}
