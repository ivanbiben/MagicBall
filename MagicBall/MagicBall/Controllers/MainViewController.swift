//
//  ViewController.swift
//  MagicBall
//
//  Created by Biben on 31.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shakeButton(_ sender: Any) {
        generateAnswer()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        generateAnswer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        HardCodedModel.sharedHardData.load()
        print(HardCodedModel.sharedHardData.hardCodedAnswers)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        HardCodedModel.sharedHardData.save()
    }
    
    func generateAnswer() {
        networkRequest()
        HardCodedModel.sharedHardData.searchdDuplicate()
        if HardCodedModel.sharedHardData.hardCodedAnswers.count != 0{
            let randomIndex = Int.random(in: 0..<HardCodedModel.sharedHardData.hardCodedAnswers.count)
            answerLabel.text = HardCodedModel.sharedHardData.hardCodedAnswers[randomIndex]
            print(HardCodedModel.sharedHardData.hardCodedAnswers[randomIndex])
        } else {
            answerLabel.text = "Yes"
        }
    }
    
    func networkRequest(){
        MagicBallNetworking.sharedMockData.fetchAnswers(complition: { res in
            switch res{
            case let .succ(data):
                DispatchQueue.main.async {
                    HardCodedModel.sharedHardData.hardCodedAnswers.append(data.magic?.answer ?? "")
                }
            case let .error(error):
                print(error)
            }
        })
    }
}


