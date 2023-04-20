//
//  SecondViewController.swift
//  PushNotiTest
//
//  Created by razaul on 17/04/23.
//

import UIKit
import StripePayments
import StripeCore
import StripeApplePay
import StripePaymentsUI
import StripePaymentSheet

class SecondViewController: UIViewController {

    @IBOutlet weak var msgText: UITextView!
    @IBOutlet weak var sampleText: UILabel!
    var sampleTextTest = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        sampleText.text = sampleTextTest
    
      
    }
    

    

}
