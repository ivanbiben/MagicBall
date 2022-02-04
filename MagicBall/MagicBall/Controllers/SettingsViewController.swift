//
//  SettingsViewController.swift
//  MagicBall
//
//  Created by Biben on 31.01.2022.
//

import UIKit

class SettingsViewController: UIViewController{
    
    
    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet var table: UITableView!
    
    
    var tableModels: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        HardCodedModel.sharedHardData.hardCodedAnswers.append(addTextField.text ?? "")
        showAlert()
        
        tableModels.append(addTextField.text ?? "")
        DispatchQueue.main.async {
            self.table.reloadData()
        }
        addTextField.resignFirstResponder()
    }
    
    func showAlert(){
        let dialogMessage = UIAlertController(title: "Great!", message: "Your answer has been added", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
        })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableModels.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableModels[indexPath.row]
        return cell
    }
    
    
    
    
    
}
