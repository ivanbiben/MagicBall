//
//  HardCodedModel.swift
//  MagicBall
//
//  Created by Biben on 31.01.2022.
//

import Foundation

class HardCodedModel{
    
    static let sharedHardData = HardCodedModel()
    
    var hardCodedAnswers = ["Yes", "No"]
    
    
    func searchdDuplicate() {
        
        var duplicateAnswers = Array(hardCodedAnswers)
        let answerSet = Set(duplicateAnswers)
        
        answerSet.forEach { num in
            if let index = duplicateAnswers.firstIndex(of: num) {
                duplicateAnswers.remove(at: index)
          }
        }
        print(answerSet)
        
    }
}
