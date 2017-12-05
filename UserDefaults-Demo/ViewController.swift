//
//  ViewController.swift
//  UserDefaults-Demo
//
//  Created by Josh Oettinger on 12/5/17.
//  Copyright © 2017 Josh Oettinger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var prompt: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        if let str = defaults.object(forKey: "savedText") as? String {
            textField.text = str
            prompt.text = "Saved text:"
        }
        
        //Give save button rounded corners
        saveButton.layer.cornerRadius = 5.0
    }
    
    @IBAction func save(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(textField.text, forKey: "savedText")
        prompt.text = "Saved text:"
        
        let alert = UIAlertController(title: "Text Saved", message: "Your text has been saved. Restart the app, and your text will still be here!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Awesome!", comment: "doink"), style: .`default`, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

