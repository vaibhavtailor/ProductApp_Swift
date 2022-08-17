//
//  CustomerDetailsViewController.swift
//  Vaibhav-Tailor_COMP2125-Sec003_Test02_Ex01
//
//  Created by user211388 on 8/16/22.
//

import UIKit

class CustomerDetailsViewController: UIViewController {

    //Defining some variables to store the data of product view controller
    var pName: String = ""
    var pQuantity: String = ""
    var pPrice: String = ""
    var pTotal: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Displaying vales to the text view.
        valuesTextView.text = String(format: "1. Product Name: %@, \n2. Quantity: %@, \n3. Price: %@, \n4. Sub-Total(price * quantity): %@", pName, pQuantity, pPrice, pTotal)
    }
    
    //Outlets
    @IBOutlet weak var custNameText: UITextField!
    
    @IBOutlet weak var nameErrorLabel: UILabel!
    
    @IBOutlet weak var custEmailText: UITextField!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    
    @IBOutlet weak var custAddressText: UITextField!
    
    @IBOutlet weak var addressErrorLabel: UILabel!
    
    @IBOutlet weak var valuesTextView: UITextView!
    
    @IBAction func continueButton(_ sender: Any) {
        
        //Resetting all the labels to default whenever the user clicks continue button
        nameErrorLabel.text = ""
        emailErrorLabel.text = ""
        addressErrorLabel.text = ""
        
        //Error handling for customer name, it cannot be empty
        if custNameText.text!.isEmpty {
            //Displaying error in label.
            nameErrorLabel.text = "The customer name field cannot be empty."
        }
        //Error handling for customer email, it cannot be empty
        else if custEmailText.text!.isEmpty {
            //Displaying error in label.
            emailErrorLabel.text = "The customer email field cannot be empty."
        }
        //Error handling for customer address, it cannot be empty
        else if custAddressText.text!.isEmpty {
            //Displaying error in label.
            addressErrorLabel.text = "The customer address field cannot be empty."
        }
        //If all the fields are proper, transferring data to order view conroller
        else {
        
        //Instantiating Order Details View Controller using Storyboard ID
        let orderVC: OrderDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderDetailsViewController") as! OrderDetailsViewController
        
        //Transferring data of objects to Order Details View Controller
        orderVC.cName = custNameText.text!
        orderVC.amount = pTotal
        
        //Navigating to Order Details View Controller
        self.navigationController?.pushViewController(orderVC, animated: true)
        }
        
    }
    
}
