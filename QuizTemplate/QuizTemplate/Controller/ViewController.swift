//
//  ViewController.swift
//  QuizTemplate
//  Learnings:
//  1. Usage of Info.plist - just setting status bar is not enough; you have to override ViewController for it.
//  2. ProgressBar - is actually a UIView - how to control length
//  3. MVC Folders + OOP in Swift
//  4. PopUp screens
//  5. Quiz Template building - QuestionBank and Question Class
//  6. What are :, _, @, ! and ? symbols
//  7. Calling external Object-C programs.
//
//  Created by Skanda Swamy on 1/2/19.
//  Copyright © 2019 Hiruco.net. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //UI elements
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBarView: UIView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    
    //variables corresponding to above
    let questions = QuestionList() //Instantiate QuestionList Object
    var userAnswer : Bool = false
    var currQuestionIndex : Int = 0 //Arr Index Initialization
    var totQuestions : Int = 0//instead of hard coding
    var userScore : Int = 0
    let popUpAlert : Bool = false // if true, then a pop up will be used instead of showing Restart button.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print ("In viewDidLoad..")
        initAll()
    }

    func initAll() {
        trueButton.isHidden = true
        falseButton.isHidden = true
        startButton.setTitle("Start", for: .normal)
        startButton.isHidden = false
        questionLabel.text = ""
        scoreLabel.text = "Score: 0"
        progressBarView.frame.size.width = 0
        totQuestions = questions.count
        progressLabel.text = "0/\(totQuestions)"
    }
    
    @IBAction func btnTouch(_ sender: UIButton) {
//        print ("In btnTouch..")
        if (sender.tag == 2) {
            trueButton.isHidden = false
            falseButton.isHidden = false
            startButton.isHidden = true
            initVariables()
            displayQuestion()
        } else {
            userAnswer = (sender.tag == 0) ? true : false
            verifyAnswer()
            currQuestionIndex += 1
            displayQuestion()
        }
  
    }

     func displayQuestion(){
//        print ("In displayQuestion")
//        print ("Total Questions: \(totQuestions), Current Question: \(currQuestionIndex + 1)")
        if (currQuestionIndex < totQuestions) {
            questionLabel.text = questions.arr[currQuestionIndex].questionText
            progressLabel.text = "\(currQuestionIndex+1)/\(totQuestions)"
            progressBarView.frame.size.width = (UIScreen.main.bounds.width / CGFloat(totQuestions)) * CGFloat(currQuestionIndex+1)
       } else {
            reStart()
        }
    }
    
    func reStart() {
        if popUpAlert {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions!", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Continue", style: .default, handler: { UIAlertAction in
                self.initAll()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        } else {
            trueButton.isHidden = true
            falseButton.isHidden = true
            startButton.setTitle("Restart", for: .normal)
            startButton.isHidden = false
            questionLabel.text = "Congratulations! You are done!"
        }
    }
    

    func verifyAnswer(){
//        print ("in verifyAnswer")
        if (userAnswer == questions.arr[currQuestionIndex].answer){
            userScore += 1
            ProgressHUD.showSuccess("Correct Answer!")
        } else {
            ProgressHUD.showError("Wrong Answer!")
        }
        displayProgress()
    }

    func displayProgress(){
//        print ("in displayProgress")
        scoreLabel.text = "Score: \(userScore)"
//        progressBarView.
    }
 
    func initVariables(){
//        print ("in initVariables")
        userAnswer = false
        currQuestionIndex  = 0
        userScore  = 0
        progressLabel.text = "\(currQuestionIndex+1)/\(totQuestions)"
        scoreLabel.text = "Score: \(userScore)"
    }

}

