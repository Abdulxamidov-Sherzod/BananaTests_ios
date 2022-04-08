//
//  ViewController.swift
//  BananaTests_ios
//
//  Created by Sherzod on 08/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelview: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func viewDidLayoutSubviews() {
        labelview.layer.cornerRadius = 30
    }
    

}

