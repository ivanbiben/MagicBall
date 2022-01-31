//
//  SettingsViewController.swift
//  MagicBall
//
//  Created by Biben on 31.01.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var addTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        HardCodedModel.sharedHardData.hardCodedAnswers.append(addTextField.text ?? "")
        
        showAlert()
        addTextField.text = ""
        
    }
    
    func showAlert(){
        let dialogMessage = UIAlertController(title: "Great!", message: "Your answer has been added", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
        })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
}
