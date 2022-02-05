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
    
    override func viewWillAppear(_ animated: Bool) {
        load()
    }
    override func viewWillDisappear(_ animated: Bool) {
        save()
        
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        tableModels.append(addTextField.text ?? "")
        showAlert()
        HardCodedModel.sharedHardData.hardCodedAnswers.append(addTextField.text ?? "")
        DispatchQueue.main.async {
            self.table.reloadData()
        }
        addTextField.resignFirstResponder()
        addTextField.text = ""
        save()
    }
    
    func showAlert(){
        let dialogMessage = UIAlertController(title: "Great!", message: "Your answer has been added", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
        })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    func save(){
        UserDefaults.standard.set(tableModels, forKey: "userAnswers")
        print(UserDefaults.standard.set(tableModels, forKey: "userAnswers"))
    }
    
    func load(){
        if let loadedData:[String] = UserDefaults.standard.value(forKey: "userAnswers") as? [String]{
            tableModels = loadedData
            table.reloadData()
        }
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
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            tableView.beginUpdates()
            tableModels.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}
