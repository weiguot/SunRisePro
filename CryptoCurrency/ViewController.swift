//
//  ViewController.swift
//  CryptoCurrency
//
//  Created by Juan carlos De la parra on 16/02/21.
//

//The is the modified code for sunrise project

import UIKit

//class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
class ViewController: UIViewController {
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var leftViewLabel: UILabel!
    
    @IBOutlet weak var middleViewImage: UIImageView!
    
    @IBOutlet weak var middleViewLabel: UILabel!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    
    @IBOutlet weak var rightViewLabel: UILabel!
    
    //@IBOutlet weak var tableCoins: UITableView!
    
    //var messages = [Coin]()
    var messages = [Results]()
   // func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     //   messages.count
    //}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //tableCoins.delegate = self
       // tableCoins.dataSource = self
        let sharedSession = URLSession.shared

           // if let url = URL(string: "https://api.coinranking.com/v1/public/coins") {
            if let url = URL(string:  "https://api.sunrise-sunset.org/json?lat=51.509865&lng=-0.118092&date=today") {
                // Create Request
                let request = URLRequest(url: url)

                // Create Data Task
                let dataTask = sharedSession.dataTask(with: request, completionHandler: { [self] (data, response, error) -> Void in
                    print(data as Any)
                    
                    do {
                        let decoder = JSONDecoder()
                       // let response = try decoder.decode(CryptoDataContainer.self, from: data!)
                        
                       // let response = try decoder.decode(SunRiseModel.self, from: data!)
                        let response = try decoder.decode(SunRiseModel.self, from: data!)
                       
                        //messages = response.data.coins
                        messages = [response.results]
                        
                        
                        
                         DispatchQueue.main.async {
                            
                            middleViewLabel.text = messages[0].solar_noon
                            rightViewLabel.text = messages[0].sunset
                            leftViewLabel.text = messages[0].sunrise                         }

                    } catch {
                        print(error)
                    }
                    
                })

                dataTask.resume()
            }
    }


}

