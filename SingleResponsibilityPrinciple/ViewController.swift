//
//  ViewController.swift
//  SingleResponsibilityPrinciple
//
//  Created by Sergei Isaikin on 17.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let urlString = "https://jsonplaceholder.typicode.com/posts/1/comments"
    
    let urlFreeApp = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/10/explicit.json"
    
    // внешние зависимости
//    var networkService = NetworkService()
    var networkDataFetcher = NetworkDataFetcher()
    let dataStore = DataStore()
    
    // элементы пользовательского интерфейса
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
        
//        dataFetcher()
        
        networkDataFetcher.fetchFreeApp(urlString: urlFreeApp) { (freeApp) in
            print(freeApp?.feed.results.first?.name)
        }
        
        networkDataFetcher.fetchEmails(urlString: urlString) { (emails) in
            print(emails?.first?.email)
        }
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

