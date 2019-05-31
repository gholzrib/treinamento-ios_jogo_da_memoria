//
//  TryAgainViewController.swift
//  Jogos da Memoria
//
//  Created by Gunther Ribak on 29/05/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class TryAgainViewController: UIViewController {
    
    @IBAction func returnToRoot(_ sender: Any?) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
