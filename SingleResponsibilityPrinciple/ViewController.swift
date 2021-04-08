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
    
    // элементы пользовательского интерфейса
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
        
        dataFetcher()
    }

    // обработка имени
    func changeName() {
        guard let name = textLabel.text, name != "" else {
            showAlert()
            return
        }
    }
    
    // MARK: - Data Storage
    
    // сохранение данных в кеш/базу данных
    func saveNameInCache(name: String) {
        print("Your name: \(name) is saved")
    }
    
    //получение данных из кеша/базы данных
    func getNameFromCache() -> String {
        return "some name"
    }
    
    // MARK: - Networking
    
    func dataFetcher() {
        request { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            guard let response = try? decoder.decode([Emails].self, from: data) else { return }
            print(response)
        }
    }
    
    func request(completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        .resume()
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

