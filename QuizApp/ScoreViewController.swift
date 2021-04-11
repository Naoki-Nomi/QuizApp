//
//  ScoreViewController.swift
//  QuizApp
//
//  Created by Naoki Nomi on 2021/04/10.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var totalScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "\(totalScore)問正解"
        
        

        // Do any additional setup after loading the view.
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
