//
//  MyBrowserViewController.swift
//  Class03
//
//  Created by Chang Chi-Chao on 2019/5/6.
//  Copyright © 2019 Chang Chi-Chao. All rights reserved.
//

import UIKit
import WebKit

class MyBrowserViewController: UIViewController, UITextFieldDelegate, AsyncReponseDelegate {
    
    
    func receviedReponse(_ sender: AsyncRequestWorker, responseString: String, tag: Int) {
        print(responseString)
        
        myWebView.loadHTMLString(responseString, baseURL: URL(string: "https://www.google.com")!)
    }
    


    @IBOutlet weak var btnGoBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let worker : AsyncRequestWorker = AsyncRequestWorker()
        
        worker.reponseDelegate = self
        worker.getResponse(from: "https://www.google.com", tag: 1)
        
        // myWebView.load(URLRequest(url: URL(string: "https://www.google.com")!))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // MARK: - Keyboard
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let accept = "abcdeABCDE"
        let cs = NSCharacterSet(charactersIn: accept).inverted
        let filters = string.components(separatedBy: cs).joined(separator: "")
        
        if( string != filters){
            return false
        }
        
        let current = textField.text! as NSString
        let newString: NSString = current.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= 10
    }
    
    @objc func keyboardWillAppear(notification:NSNotification?) {
        print("keyboardWillAppear")
        guard let frame = notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
            self.btnGoBottomConstraint.constant = frame.cgRectValue.height;
    }

    @objc func keyboardWillDisappear(notification:NSNotification?) {
        print("keyboardWillDisappear")
        self.btnGoBottomConstraint.constant = 35;
    }

}
