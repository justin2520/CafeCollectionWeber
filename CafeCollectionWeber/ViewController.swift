//
//  ViewController.swift
//  CafeCollectionWeber
//
//  Created by JUSTIN WEBER on 9/9/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var listTextViewOutlet: UITextView!
    
    @IBOutlet weak var shoppingCartTextViewOutlet: UITextView!
    
    @IBOutlet weak var totalPriceTextViewOutlet: UITextView!
    
    @IBOutlet weak var itemTextFieldOutlet: UITextField!
    
    @IBOutlet weak var quantityTextFieldOutlet: UITextField!
    
    @IBOutlet weak var errorLabelOutlet: UILabel!
    
    var food = ["Apple", "Orange", "Cherry", "Peach", "Pear"]
    var price = [1.00, 1.50, 1.75, 2.50, 0.50]
    var shoppingCart: [String] = []
    var quantity: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        for i  in 0..<food.count{
            listTextViewOutlet.text += food[i] + ": " + String(price[i]) + "\n"
        }
    }
    
    @IBAction func addToCartButtonAction(_ sender: UIButton) {
        errorLabelOutlet.isHidden = true
        var invalidError = true
        
        for i  in food{
            if i == itemTextFieldOutlet.text{
                invalidError = false
            }
        }
        
        if invalidError{
            errorLabelOutlet.text = "Error! This is not on sale!"
            errorLabelOutlet.isHidden = false
            return
        }
        
        
        var shoppingCartError = false
        
        for i  in shoppingCart{
            if i == itemTextFieldOutlet.text{
                shoppingCartError = true
            }
        }
        
        if shoppingCartError{
            errorLabelOutlet.text = "Error! You already have this!"
            errorLabelOutlet.isHidden = false
            return
        }
        
        
        var quantityError = false
        
        if Int(quantityTextFieldOutlet.text!) == nil || Int(quantityTextFieldOutlet.text!)! < 1{
            quantityError = true
        }
        
        if quantityError{
            errorLabelOutlet.text = "Error! Invalid quantity!"
            errorLabelOutlet.isHidden = false
            return
        }
        
        
        shoppingCart.append(itemTextFieldOutlet.text!)
        quantity.append(Int(quantityTextFieldOutlet.text!)!)
        
        shoppingCartTextViewOutlet.text += itemTextFieldOutlet.text! + ": " + quantityTextFieldOutlet.text! + "\n"
        
        
        var totalCost = 0.0
        for i  in 0..<shoppingCart.count{
            totalCost += Double(quantity[i]) * price[i]
        }
        
        totalPriceTextViewOutlet.text = String(totalCost)
    }
    
    


}

