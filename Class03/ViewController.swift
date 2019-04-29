//
//  ViewController.swift
//  Class03
//
//  Created by Chang Chi-Chao on 2019/4/15.
//  Copyright © 2019 Chang Chi-Chao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbmsg: UILabel!
    @IBAction func btnpushclicked(_ sender: Any) {
        lbmsg.text = "Hi, XCode"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

