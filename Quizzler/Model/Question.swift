//
//  Question.swift
//  Quizzler
//
//  Created by Dayton on 11/12/20.
//

import Foundation

struct Question {
    let text:String
    let choice:[String]
    let answer:String
    
    
    init(q:String, a:[String], correctAnswer:String) {
        text = q
        choice = a
        answer = correctAnswer
    }
}

