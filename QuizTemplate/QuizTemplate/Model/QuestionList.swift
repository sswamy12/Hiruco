//
//  QuestionList.swift
//  QuizTemplate
//
//  Created by Skanda Swamy on 1/2/19.
//  Copyright © 2019 Hiruco.net. All rights reserved.
//

import Foundation

class QuestionList {
    var arr = [Question]()
    var count : Int = 0
    init() {
        arr.append(Question(text : "Question 1", correctAnswer : true))
        arr.append(Question(text : "Question 2", correctAnswer : false))
        arr.append(Question(text : "Question 3", correctAnswer : true))
        arr.append(Question(text : "Question 4", correctAnswer : true))
        arr.append(Question(text : "Question 5", correctAnswer : true))

        count = arr.count
    }
    
}
