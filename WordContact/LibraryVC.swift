//
//  LibraryVC.swift
//  WordContact
//
//  Created by Antony Kolesynskyi on 5/19/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import UIKit

class LibraryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var gradientView: UIView!
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    let mainTextField = MainVC()
    let wordsArray = ["Дальний","Работа", "Проход", "Катастрофа", "Космос", "Вселенная", "Женщина", "Студент", "Профессионал", "Адвокат", "Барабанщик","Железный","Старость","Молодость","Свобода","Академия","Вечность","Вероятность","Ветер","Друг","Родина","Дракон","Испарение","Ласточка","Лампа","Ненависть","Наивный","Долгожитель","Купец","Близкий","Обморок","Обжора","Политика","Дерево","Планета","Океан","Картошка","Любовь","Вечность"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func gradientFunc() {
        let gradientLayer: CAGradientLayer!
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.gradientView.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        self.gradientView.layer.addSublayer(gradientLayer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gradientFunc()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }


     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return wordsArray.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = wordsArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: "Apple SD Gothic Neo", size: 25)
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(wordsArray[indexPath.row])")
        textFieldText = String("\(wordsArray[indexPath.row])")
        dismiss(animated: true, completion: nil)
    }
    
}
