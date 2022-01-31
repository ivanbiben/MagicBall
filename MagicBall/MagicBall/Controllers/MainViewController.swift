//
//  ViewController.swift
//  MagicBall
//
//  Created by Biben on 31.01.2022.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shakeButton(_ sender: Any) {
        
        MagicBallNetworking.sharedMockData.fetchAnswers(complition: { res in
            switch res{
            case let .succ(data):
                print(data.magic?.answer ?? "")
                
            case let .error(error):
                print(error)
            }
        })
    }
    
    
    
}

