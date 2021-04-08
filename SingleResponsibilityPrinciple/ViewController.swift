//
//  ViewController.swift
//  SingleResponsibilityPrinciple
//
//  Created by Sergei Isaikin on 17.03.2021.
//

import UIKit

struct Emails: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}

class ViewController: UIViewController {
    
    let urlString = "https://jsonplaceholder.typicode.com/posts/1/comments"
    
    // внешние зависимости
    var networkService = NetworkService()
    let dataStore = DataStore()
    
    // элементы пользовательского интерфейса
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
        
//        dataFetcher()
        networkService.dataFetcher(urlString: urlString)
    }

    // MARK: - Busines logic
    
    // обработка имени
    func changeName() {
        guard let name = textLabel.text, name != "" else {
            showAlert()
            return
        }
        
        dataStore.saveNameInCache(name: name)
    }
    
    // MARK: - User Interface
    
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

