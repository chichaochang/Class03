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
    
    @IBAction func onMapClicked(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "myMapSegue", sender: self)
        }
    }
    @IBAction func btnMoveM2KClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "資訊", message: "YN", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "YES", style: .default, handler: { action in
            // 因為呼叫外部函數, 所以必須要確認回到main thread執行
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "nowM2KSegue", sender: self)
            }
        })
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "NO", style: .default, handler: { action in
        })
        alert.addAction(cancelAction)

        
        present(alert, animated: true, completion: nil)
        
        // performSegue(withIdentifier: "nowM2KSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let worker : FileWorker = FileWorker()
        
        worker.writeToFile(content: "中文", fileName: "info.txt", tag: 0 )
        
        let result : String = worker.readFromFile(fileName: "info.txt", tag: 0)
        
        print(result)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if( segue.identifier == "nowM2KSegue"){
            let vc = segue.destination as! ImageViewController
            vc.index = 5
        }
    }


}

