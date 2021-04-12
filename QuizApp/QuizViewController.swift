//
//  QuizViewController.swift
//  QuizApp
//
//  Created by Naoki Nomi on 2021/04/10.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var quizNumber: UILabel!
    @IBOutlet weak var quizContent: UITextView!
    @IBOutlet weak var quizAnswer1: UIButton!
    @IBOutlet weak var quizAnswer2: UIButton!
    @IBOutlet weak var quizAnswer3: UIButton!
    @IBOutlet weak var quizAnswer4: UIButton!
    @IBOutlet weak var JudgeImageView: UIImageView!
    @IBOutlet weak var QuizExplanation: UITextView!
    @IBOutlet weak var MoveToNextQuiz: UIButton!
    
    var csvArray = [String]()
    var eachArray = [String]()
    var selectLevel = 0
    var quizCount = 0
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizAnswer1.layer.borderWidth = 2
        quizAnswer1.layer.borderColor = UIColor.black.cgColor
        quizAnswer2.layer.borderWidth = 2
        quizAnswer2.layer.borderColor = UIColor.black.cgColor
        quizAnswer3.layer.borderWidth = 2
        quizAnswer3.layer.borderColor = UIColor.black.cgColor
        quizAnswer4.layer.borderWidth = 2
        quizAnswer4.layer.borderColor = UIColor.black.cgColor
        MoveToNextQuiz.layer.borderWidth = 2
        MoveToNextQuiz.layer.borderColor = UIColor.black.cgColor
        
        csvArray = loadCSV(fileName: "quiz\(selectLevel)")
        csvArray.shuffle()
        eachArray = csvArray[quizCount].components(separatedBy: ",")
        quizNumber.text = "第\(quizCount+1)問"
        quizContent.text = eachArray[0]
        quizAnswer1.setTitle(eachArray[2], for: .normal)
        quizAnswer2.setTitle(eachArray[3], for: .normal)
        quizAnswer3.setTitle(eachArray[4], for: .normal)
        quizAnswer4.setTitle(eachArray[5], for: .normal)
        QuizExplanation.isHidden = true
        MoveToNextQuiz.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAction(sender: UIButton){
        if sender.tag == Int(eachArray[1]) {
            JudgeImageView.image = UIImage(named: "correct")
            score += 1
        }
        else {
            JudgeImageView.image = UIImage(named: "incorrect")
        }
        if quizCount < csvArray.count - 1 {
            MoveToNextQuiz.setTitle("次の問題に進む", for: .normal)
        } else {
            MoveToNextQuiz.setTitle("結果を確認する", for: .normal)
        }
        JudgeImageView.isHidden = false
        QuizExplanation.isHidden = false
        QuizExplanation.text = eachArray[6]
        MoveToNextQuiz.isHidden = false
        quizAnswer1.isEnabled = false
        quizAnswer2.isEnabled = false
        quizAnswer3.isEnabled = false
        quizAnswer4.isEnabled = false
    }
    
    @IBAction func NextQuiz(_ sender: Any) {
        nextQuiz()
        QuizExplanation.isHidden = true
        MoveToNextQuiz.isHidden = true
        JudgeImageView.isHidden = true
        quizAnswer1.isEnabled = true
        quizAnswer2.isEnabled = true
        quizAnswer3.isEnabled = true
        quizAnswer4.isEnabled = true
    }
    
    
    func loadCSV(fileName: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            var lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            lineChange = lineChange.replacingOccurrences(of: "\n\n", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch {
            print("エラー発生")
        }
        return csvArray
    }
    
    func nextQuiz() {
        quizCount += 1
        if quizCount < csvArray.count {
            eachArray = csvArray[quizCount].components(separatedBy: ",")
            quizNumber.text = "第\(quizCount+1)問"
            quizContent.text = eachArray[0]
            quizAnswer1.setTitle(eachArray[2], for: .normal)
            quizAnswer2.setTitle(eachArray[3], for: .normal)
            quizAnswer3.setTitle(eachArray[4], for: .normal)
            quizAnswer4.setTitle(eachArray[5], for: .normal)
        } else {
            self.performSegue(withIdentifier: "MoveToScoreVC", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoreVC = segue.destination as! ScoreViewController
        scoreVC.totalScore = score
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
