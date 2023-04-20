//
//  CustomSPViewController.swift
//  PushNotiTest
//
//  Created by razaul on 18/04/23.
//

import UIKit
import StripePayments

class CustomSPViewController: UIViewController {

    @IBOutlet weak var CvcTextF: UITextField!
    @IBOutlet weak var expTextF: UITextField!
    @IBOutlet weak var numberTextF: UITextField!
    @IBOutlet weak var nameTextF: UITextField!
    
    @IBOutlet weak var msgBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Custom Stripe Pay"
       
    }
    

    @IBAction func payStripeAction(_ sender: Any) {
        let comps = expTextF.text?.components(separatedBy: "/")
        let f = UInt(comps!.first!)
        let l = UInt(comps!.last!)
        
        let cardParams = STPCardParams()
        cardParams.name = nameTextF.text!
        cardParams.number = numberTextF.text!
        cardParams.expMonth = f!
        cardParams.expYear =  l!
        cardParams.cvc = CvcTextF.text!

        STPAPIClient.shared.createToken(withCard: cardParams) { (token: STPToken?, error: Error?) in
            print("Printing Strip response:\(String(describing: token?.allResponseFields))\n\n")
            print("Printing Strip Token:\(String(describing: token?.tokenId))")
            
            
            if error != nil {
                print(error?.localizedDescription ?? "")
            }
            
            if token != nil{
                self.msgBox.text = "Transaction success! \n\nHere is the Token: \(String(describing: token!.tokenId))\nCard Type: \(String(describing: token!.card!.funding))\n\nSend this token or detail to your backend server to complete this payment."
            }
        }
        
    }
    

}
