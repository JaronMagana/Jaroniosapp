//
//  ViewController.swift
//  JaronFirstAPp
//
//  Created by David Freese on 5/19/17.
//  Copyright © 2017 Jaron Magana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var name: String! = "John Doe"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setName(newName: nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        print("self.myButton.bounds = %@", NSStringFromCGRect(sender.bounds));
        
        let message = String(format: "%C", 0xe04f)
        let alertController = UIAlertController(title: "Im an Action Sheet!", message: message, preferredStyle: .actionSheet)
        alertController.popoverPresentationController?.sourceView = sender
        alertController.popoverPresentationController?.sourceRect = sender.bounds
        
        let OKAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setName(newName: String?) {
        if newName != nil {
            self.name = newName
        }
        self.nameLabel.text = "Hello " + self.name;
    }

    @IBAction func changeNameClicked(_ sender: UIButton) {
        //1. Create the alert controller.
        let alertController = UIAlertController(title: "Some Title", message: "Enter a text", preferredStyle: .alert)
        alertController.popoverPresentationController?.sourceView = sender
        //alertController.popoverPresentationController?.sourceRect = sender.bounds
        
        //2. Add the text field. You can configure it however you need.
        alertController.addTextField { (textField) in
            textField.text = self.name
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alertController] (_) in
            let newName = alertController?.textFields?[0].text
            if newName != nil {
                self.setName(newName: newName)
            }
        }))
        
        //alertController4. Add cancel action
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // 5. Present the alert.
        self.present(alertController, animated: true, completion: nil)
    }

}

