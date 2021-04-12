//
//  ViewController.swift
//  QuizApp
//
//  Created by Naoki Nomi on 2021/04/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }


}

