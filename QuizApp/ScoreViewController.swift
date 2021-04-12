//
//  ScoreViewController.swift
//  QuizApp
//
//  Created by Naoki Nomi on 2021/04/10.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var ScoreReviewImage: UIImageView!
    
    var totalScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "\(totalScore)問正解"
        ScoreReviewImage.image = UIImage(named: "points\(totalScore)")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func MoveToTop(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func ShareScore(_ sender: Any) {
        let activityItems = ["\(totalScore)問正解しました", "#クイズアプリ"]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityVC, animated: true)
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
