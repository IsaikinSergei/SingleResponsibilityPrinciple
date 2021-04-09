//
//  ViewController.swift
//  SingleResponsibilityPrinciple
//
//  Created by Sergei Isaikin on 17.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // внешние зависимости
//    var networkService = NetworkService()
    var dataFetcherService = DataFetcherService()
    let dataStore = DataStore()
    
    // элементы пользовательского интерфейса
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
        
        dataFetcherService.fetchEmails { (emails) in
            print(emails?.first?.email)
        }
        dataFetcherService.fetchFreeApp { (freeApp) in
            print(freeApp?.feed.results.first?.name)
        }
        dataFetcherService.fetchNewGames { (newGames) in
            print(newGames?.feed.results.first?.name)
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

