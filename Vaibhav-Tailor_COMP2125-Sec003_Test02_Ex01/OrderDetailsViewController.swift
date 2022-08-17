//
//  OrderDetailsViewController.swift
//  Vaibhav-Tailor_COMP2125-Sec003_Test02_Ex01
//
//  Created by user211388 on 8/16/22.
//

import UIKit

class OrderDetailsViewController: UIViewController {

    //Defining some variables to store the data of product view controller
    var cName: String = ""
    var amount: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Defining random number generator to generate order id of 3 digits
        let randomId = Int.random(in: 100...999)
        orderIdText.text! = String(randomId)
        
        //Defining some variables to calculate the total price with tax
        let total = Double(amount) ?? 0
        let tax = total * 0.13
        let totalWithTax = String(total + tax)
        
        //Displaying the data into the text fields
        custNameText.text = cName
        totalText.text = totalWithTax
        
    }
    
    @IBOutlet weak var orderIdText: UITextField!
    
    @IBOutlet weak var custNameText: UITextField!
    
    @IBOutlet weak var totalText: UITextField!
    
    @IBOutlet weak var displayTextView: UITextView!
    
    @IBAction func completeButton(_ sender: Any) {
        
        //Displaying text when user clicks complete button
        displayTextView.text = "Thanks for shopping with us."
    }
    
}
