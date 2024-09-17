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
    
    @IBOutlet weak var passwordTextFieldOutlet: UITextField!
    
    @IBOutlet weak var submitPasswordButtonOutlet: UIButton!
    
    @IBOutlet weak var adminAreaLabelOutlet: UILabel!
    
    @IBOutlet weak var enterItemTextFieldOutlet: UITextField!
    
    @IBOutlet weak var enterPriceTextFieldOutlet: UITextField!
    
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    @IBOutlet weak var deleteButtonOutlet: UIButton!
    
    var food = ["Apple", "Orange", "Cherry", "Peach", "Pear"]
    var price = [1.00, 1.50, 1.75, 2.50, 0.50]
    var shoppingCart: [String] = []
    var quantity: [Int] = []
    var shoppingCartPrice: [Double] = []
    
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
        
        for i  in 0..<food.count{
            if food[i] == itemTextFieldOutlet.text{
                shoppingCartPrice.append(price[i])
            }
        }
        
        shoppingCartTextViewOutlet.text += itemTextFieldOutlet.text! + ": " + quantityTextFieldOutlet.text! + "\n"
        
        
        var totalCost = 0.0
        
        for i  in 0..<shoppingCart.count{
            totalCost += Double(quantity[i]) * shoppingCartPrice[i]
        }
        
        totalPriceTextViewOutlet.text = String(totalCost)
    }
    
//    @IBAction func passwordButtonAction(_ sender: UIButton) {
//        if passwordTextFieldOutlet.text == "cogitoErgoSum"{
//            passwordTextFieldOutlet.isHidden = true
//            submitPasswordButtonOutlet.isHidden = true
//            adminAreaLabelOutlet.isHidden = false
//            enterItemTextFieldOutlet.isHidden = false
//            enterPriceTextFieldOutlet.isHidden = false
//            addButtonOutlet.isHidden = false
//            deleteButtonOutlet.isHidden = false
//        }
//    }
//    
//    @IBAction func addButtonAction(_ sender: UIButton) {
//        var invalidError = false
//        
//        for i  in food{
//            if i == enterItemTextFieldOutlet.text{
//                invalidError = true
//            }
//        }
//        
//        if invalidError{
//            return
//        }
//        
//        if Double(enterPriceTextFieldOutlet.text!) == nil || Double(enterPriceTextFieldOutlet.text!)! <= 0{
//            return
//        }
//        
//        
//        food.append(enterItemTextFieldOutlet.text!)
//        price.append(Double(enterPriceTextFieldOutlet.text!)!)
//        
//        listTextViewOutlet.text += food[food.count - 1] + ": " + String(price[price.count - 1]) + "\n"
//    }
//    
//    @IBAction func deleteButtonAction(_ sender: UIButton) {
//        for i  in 0..<food.count{
//            if itemTextFieldOutlet.text == food[i]{
//                food.remove(at: i)
//                price.remove(at: i)
//                
//                itemTextFieldOutlet.text = ""
//                
//                for q  in 0..<food.count{
//                    listTextViewOutlet.text += food[q] + ": " + String(price[q]) + "\n"
//                }
//                
//                
//                for r  in 0..<shoppingCart.count{
//                    if shoppingCart[r] == food[i]{
//                        shoppingCart.remove(at: r)
//                        
//                        for s  in 0..<shoppingCart.count{
//                            shoppingCartTextViewOutlet.text += shoppingCart[s] + ": " + String(quantity[s]) + "\n"
//                        }
//                        
//                        var totalCost = 0.0
//                        
//                        for i  in 0..<shoppingCart.count{
//                            totalCost += Double(quantity[i]) * price[i]
//                        }
//                        
//                        totalPriceTextViewOutlet.text = String(totalCost)
//                        
//                        break
//                    }
//                }
//                
//                break
//            }
//        }
//    }
    


}

