//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Skanda Swamy on 1/1/19.
//  Copyright © 2019 Hiruco.net. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let magic8BallArray = ["ball1","ball2","ball3","ball4","ball5","SFO"]
    var randomAnswer : Int = 0
    @IBOutlet weak var magic8Title: UILabel!
    
    @IBOutlet weak var magic8BallView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    @IBAction func askButton(_ sender: Any) {
        provideAnswer()
    }
    
    @IBAction func picInPic(_ sender: Any) {
        magic8BallView.image = UIImage.init(named:  magic8BallArray[5])
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        provideAnswer()
    }
    
    func provideAnswer() {
        randomAnswer = Int.random(in: 0...4)
        //        print ("Button Clicked. Generated: \(randomAnswer)")
        magic8BallView.image = UIImage.init(named:  magic8BallArray[randomAnswer])
        magic8Title.text = "Magic 8 Ball!"
    }
    
}

