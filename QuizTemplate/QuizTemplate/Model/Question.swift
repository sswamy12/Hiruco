//
//  Question.swift
//  QuizTemplate
//
//  Created by Skanda Swamy on 1/2/19.
//  Copyright © 2019 Hiruco.net. All rights reserved.
//

import Foundation

class Question {
    //Attributes
    let questionText : String
    let answer : Bool
    
    //Methods
    init(text : String, correctAnswer : Bool){
        questionText = text
        answer = correctAnswer
    }
}

