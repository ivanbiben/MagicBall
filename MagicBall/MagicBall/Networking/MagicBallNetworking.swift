//
//  MagicBallNetworking.swift
//  MagicBall
//
//  Created by Biben on 31.01.2022.
//

import Foundation

final class MagicBallNetworking: NetworkManager {
    
    static var sharedMockData = MagicBallNetworking()
    
    private override init() {}
    
    func fetchAnswers(complition: @escaping (_ res: Result<MockModel>) -> Void){
        fetchRequest(complition: complition)
    }
}

