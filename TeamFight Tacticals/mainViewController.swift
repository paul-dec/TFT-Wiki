//
//  mainViewController.swift
//  TeamFight Tacticals
//
//  Created by Paul Decrosse on 25/06/2019.
//  Copyright © 2019 tchouki. All rights reserved.
//

import UIKit
import GoogleMobileAds
class mainViewController: UIViewController {
    
    @IBOutlet weak var legendImage: UIImageView!
    @IBOutlet weak var GoogleBannerView: GADBannerView!
    
    func random_legend() {
        let random = Int.random(in: 1...3)
        let name = "legend" + String(random)
        legendImage.image = UIImage(named: name)
    }
    
    override func viewDidLoad() {
        random_legend()
        //GoogleBannerView.adUnitID = "ca-app-pub-9255058538010369/7241313232"
        GoogleBannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        GoogleBannerView.rootViewController = self
        GoogleBannerView.load(GADRequest())
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.title = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
        if segue.identifier == "champion" {
            navigationItem.title = "Champion"
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
        if segue.identifier == "item" {
            navigationItem.title = "Item"
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
        if segue.identifier == "class" {
            navigationItem.title = "Class"
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
}

