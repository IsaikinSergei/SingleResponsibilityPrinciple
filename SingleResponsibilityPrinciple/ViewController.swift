//
//  ViewController.swift
//  SingleResponsibilityPrinciple
//
//  Created by Sergei Isaikin on 17.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // элементы пользовательского интерфейса
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
    }

    // обработка имени
    
    func changeName() {
        guard let name = textLabel.text, name != "" else {
            showAlert()
            return
        }
        print("Your name: \(name)")
    }
    
    // отображение интерфейса
    
    func showAlert() {
        let alert = UIAlertController(title: "WARNING", message: "Your name can't be empty", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // взаимодействие пользователя с интерфейсом
    
    @IBAction func changeLabel(_ sender: Any) {
        textLabel.text = myTextField.text
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        changeName()
    }
    
}

