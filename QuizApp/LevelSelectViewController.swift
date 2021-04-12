//
//  LevelSelectViewController.swift
//  QuizApp
//
//  Created by Naoki Nomi on 2021/04/10.
//

import UIKit

class LevelSelectViewController: UIViewController {
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    
    var selectTag = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        easyButton.layer.borderWidth = 2
        easyButton.layer.borderColor = UIColor.black.cgColor
        normalButton.layer.borderWidth = 2
        normalButton.layer.borderColor = UIColor.black.cgColor
        hardButton.layer.borderWidth = 2
        hardButton.layer.borderColor = UIColor.black.cgColor

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quizVC = segue.destination as! QuizViewController
        quizVC.selectLevel = selectTag
    }
    
    @IBAction func btnAction(sender: UIButton){
        print(sender.tag)
        selectTag = sender.tag
        performSegue(withIdentifier: "MoveToQuizVC", sender: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
