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
        let worker : FileWorker = FileWorker()
        
        worker.writeToFile(content: "中文", fileName: "info.txt", tag: 0 )
        
        let result : String = worker.readFromFile(fileName: "info.txt", tag: 0)
        
        print(result)
    }


}

