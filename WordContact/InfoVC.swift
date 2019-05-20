//
//  InfoVC.swift
//  WordContact
//
//  Created by Antony Kolesynskyi on 5/19/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var infoView: UIView!
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    let infoText = "Цель игры: отгадать слово, задуманное ведущим. Ведущий задумывает слово (существительное в единсвенном числе именительного падежа) и называет остальным игрокам первую букву этого слова. Например, задумано слово катастрофа. Говорится: «к». Каждый из остальных игроков придумывает слово, начинающееся с этой буквы, и пытается объяснить другим, что он задумал. Например, придумано слово кошка, объяснить которое можно так: «та, кто гуляет сама по себе» или «четвероногое, хвостатое». Если кто-то из игроков понял какое слово задумано тем, кто объяснял, то он говорит «Есть контакт!» и оба (объяснявший и откликнувшийся) начинают вслух считать до 3, а затем говорят каждый свое слово. Если слово совпало («Один, два, … , десять, кошка!»), то ведущий называет вторую букву слова, и игра продолжается дальше, только теперь нужно придумывать и объяснять слово с уже заданными начальными буквами. Из примера «ка» (потом на «кат», «ката» и т.д.). Если же слово не совпало («Один, два, … , десять, кошка/коза!»), то игроки продолжают пытаться придумать и объяснять новое слово. При этом ведущий может прервать счет словами: «Нет, это не ...» (кошка). Тогда счет останавливается. Если слово угадано командой, то ведущим становится тот игрок, кто первый назвал слово. Если команда сдается, то выиграл ведущий и он задумывает новое слово."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoTextView.text = infoText
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        createGradientLayer()
    }
    

    func createGradientLayer() {
        let gradientLayer: CAGradientLayer!
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.infoView.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        self.infoView.layer.addSublayer(gradientLayer)
    }

}
