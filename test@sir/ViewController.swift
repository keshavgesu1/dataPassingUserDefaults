//
//  ViewController.swift
//  test@sir
//
//  Created by Keshav Raj Kashyap on 30/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var result = [UserModel]()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        /* let userModelData = UserDefaults.standard.value(forKey: "userDefault")
         if userModelData != nil{
         do {
         let data = try JSONDecoder().decode([UserModel].self, from: userModelData as! Data)
         self.result = data
         UserDefaults.standard.synchronize()
         tableView.reloadData()
         }
         catch {
         print("error")
         }
         }*/
        NotificationCenter.default.addObserver(self, selector: #selector(refreshList(_:)), name: Notification.Name(".receive"), object: nil)
    }
    @objc func refreshList(_ notification: Notification) {
        if let Myresult = notification.object{
            if Myresult != nil{
                do {
                let data = try JSONDecoder().decode([UserModel].self, from: Myresult as! Data)
                self.result = data
                tableView.reloadData()
                }
                catch {
                    print("error")
                    }
            }
        }
    }
    

    // Get Userdefault
    // Array of user models
    // userModel = array
    // tb reload
    
///this button takes us to next viewcontroller to enter data of user
    @IBAction func btnNextVc(_ sender: UIButton) {
       let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")as! SecondViewController
        self.navigationController?.present(nextVc, animated: true, completion: nil)
    }
}



//MARK :- TABLEVIEW DELEGATES AND DATASOURCE

extension ViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)as! TableViewCell
        cell.lblData.text = "1. name is \(result[indexPath.row].name) " + "2. dept is \(result[indexPath.row].dept) " + "3. designation is \(result[indexPath.row].degination) "
        cell.lblData.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
