//
//  GameVC.swift
//  WordContact
//
//  Created by Antony Kolesynskyi on 5/19/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import UIKit
import SCLAlertView

class GameVC: UIViewController {

    @IBOutlet weak var wordView: UIView!
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var nextCharacter: UIButton!
    var indexOfCharacter = 1
    
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextCharacter(_ sender: Any) {
        characterFunc()
    }
    
    @IBAction func endGameAction(_ sender: Any) {
        wordLabel.text = textFieldText
        endAlertFunc()
    }
    
    func endAlertFunc() {
        let alertView = SCLAlertView()
        alertView.showSuccess("\(textFieldText):", subTitle: "Это ваше загаданное слово", closeButtonTitle: "ОК")
    }
    
    func createGradientLayer() {
        let gradientLayer: CAGradientLayer!
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.gameView.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        self.gameView.layer.addSublayer(gradientLayer)
    }
    
    func characterFunc() {
        var components = textFieldText.components(separatedBy: .whitespacesAndNewlines)
        var maxIndex = textFieldText.count
        if indexOfCharacter < maxIndex {
            indexOfCharacter += 1
            let character = textFieldText.prefix(indexOfCharacter)
            wordLabel.text = String("\(character)")
        } else {
            endAlertFunc()
            textFieldText = ""
            print("end of game")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let character = textFieldText.prefix(indexOfCharacter)
        wordLabel.text = String("\(character)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        createGradientLayer()
        self.wordView.layer.cornerRadius = 8
        nextCharacter.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        nextCharacter.layer.cornerRadius = 8
    }

}

