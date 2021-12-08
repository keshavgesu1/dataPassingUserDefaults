//
//  SecondViewController.swift
//  test@sir
//
//  Created by Keshav Raj Kashyap on 30/11/21.
//

import UIKit


class SecondViewController: UIViewController {
    
    @IBOutlet weak var txtName:UITextField!
    @IBOutlet weak var txtDept:UITextField!
    @IBOutlet weak var txtDegination:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
   
    
    
    
    @IBAction func btnDismiss(_ sender: UIButton) {
        var arrayUsers = [UserModel]()
        let userModelData = UserDefaults.standard.value(forKey: "userDefault")
        if userModelData != nil{
            do {
                let data = try JSONDecoder().decode([UserModel].self, from: userModelData as! Data)
                arrayUsers = data
            }
            catch {
                print("error")
            }
        }
        
        var user = UserModel()
        user.name = txtName.text!
        user.dept = txtDept.text!
        user.degination = txtDegination.text!
        arrayUsers.append(user)
        do {
            let data = try JSONEncoder().encode(arrayUsers)
            NotificationCenter.default.post(name: Notification.Name(".receive"), object: data)
         //   UserDefaults.standard.set(data, forKey: "userDefault")
           // UserDefaults.standard.synchronize()
        }
        catch {
            print("error")
        }
//        txtName.text = ""
//        txtDept.text = ""
//        txtDegination.text = ""
        self.dismiss(animated: true, completion: nil)
        
        
        
    }
}
