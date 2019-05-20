//
//  MainVC.swift
//  WordContact
//
//  Created by Antony Kolesynskyi on 5/19/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import UIKit
import SCLAlertView

var textFieldText = ""

class MainVC: UIViewController {

    @IBOutlet weak var wordsView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func libraryButton(_ sender: Any) {
        performSegue(withIdentifier: "library", sender: self)
    }
    @IBAction func startButtonAction(_ sender: Any) {
        if wordTextField.text == "" {
            alertFunc()
            print("zapoli pole")
        } else {
            textFieldText = wordTextField.text!
            print("\(textFieldText) textFieldText")
            performSegue(withIdentifier: "start", sender: self)
        }
    }
    @IBAction func infoButton(_ sender: Any) {
        performSegue(withIdentifier: "info", sender: self)
    }
    
    func createGradientLayer() {
        let gradientLayer: CAGradientLayer!
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.mainView.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        self.mainView.layer.addSublayer(gradientLayer)
    }
    
    func alertFunc() {
        let alertView = SCLAlertView()
        alertView.showWarning("Не так быстро!", subTitle: "Введите своё слово", closeButtonTitle: "ОК")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordTextField.font = .systemFont(ofSize: 38)
        startButton.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        startButton.layer.cornerRadius = 8
        wordsView.layer.cornerRadius = 8
        
        wordTextField.text = textFieldText
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        wordTextField.text = textFieldText
        createGradientLayer()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_textField: UITextField) -> Bool {
        wordTextField.resignFirstResponder()
        return (true)
    }
    
    func registerforKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    

}
