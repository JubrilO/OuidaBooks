//
//  PersonalDeetsViewController.swift
//  Ouida Books
//
//  Created by Jubril on 4/19/18.
//  Copyright © 2018 bitkoin. All rights reserved.
//

import UIKit

class PersonalDeetsViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onNextButtonTap(_ sender: UIButton) {
        if  let accountDeetsVC = storyboard?.instantiateViewController(withIdentifier: Constants.StoryboardIDs.AccountDetailsScene) as? AccountDetailsViewController {
        navigationController?.pushViewController( accountDeetsVC, animated: true)
        }
    }
    
    @IBAction func onBackgroundTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
}
