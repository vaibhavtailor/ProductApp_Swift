//
//  ProductDetailsViewController.swift
//  Vaibhav-Tailor_COMP2125-Sec003_Test02_Ex01
//
//  Created by user211388 on 8/16/22.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Defining random number generator
        let randomId = Int.random(in: 10000...99999)
        productIdText.text! = String(randomId)
    }
    
    //Outlets
    @IBOutlet weak var productIdText: UITextField!
    
    @IBOutlet weak var idErrorLabel: UILabel!
    
    @IBOutlet weak var productNameText: UITextField!
    
    @IBOutlet weak var nameErrorLabel: UILabel!
    
    @IBOutlet weak var productPriceText: UITextField!
    
    @IBOutlet weak var priceErrorLabel: UILabel!
    
    @IBOutlet weak var quantityText: UITextField!
    
    @IBOutlet weak var quantityErrorLabel: UITextView!
    
    @IBAction func submitButton(_ sender: Any) {
        
        //Resetting all the labels to default whenever the user clicks submit button
        idErrorLabel.text = ""
        nameErrorLabel.text = ""
        priceErrorLabel.text = ""
        quantityErrorLabel.text = ""
        
        //Defining some variabes to convert textfield into integer.
        let price = Int(productPriceText.text ?? "") ?? 0
        let quantity = Int(quantityText.text ?? "") ?? 0
        
        //Error handling for product id, it should be of 5 digits
        if productIdText.text!.count < 5 || productIdText.text!.count > 5 {
            //Displaying error in label.
            idErrorLabel.text = "The product id should be of 5 digits only."
        }
        //Error handling for product name, it should not be empty
        else if productNameText.text!.isEmpty {
            //Displaying error in label.
            nameErrorLabel.text = "The product name cannot be empty."
        }
        //Error handling for product price, it should be more than 0
        else if price <= 0 {
            //Displaying error in label.
            priceErrorLabel.text = "The product price should be more than 0."
        }
        //Error handling for quantity, it should be 1 or 2
        else if quantity < 1 || quantity > 2 {
            //Displaying error in label.
            quantityErrorLabel.text = "The product quantity cannot be less than 1 and more than 2."
        }
        //If there are no errors transferring data to customer detailsVC
        else {
        //Instantiating Custome Details View Controller using Storyboard ID
        let customerVC: CustomerDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "CustomerDetailsViewController") as! CustomerDetailsViewController
        
        //Defining some variables to calculate the total price
        let total = String(price * quantity)
        
        //Transferring data of objects to Customer Details View Controller
        customerVC.pName = productNameText.text!
        customerVC.pQuantity = quantityText.text!
        customerVC.pPrice = productPriceText.text!
        customerVC.pTotal = total
        
        //Navigating to Customer Details View Controller
        self.navigationController?.pushViewController(customerVC, animated: true)
        }
        
    }
    
}
