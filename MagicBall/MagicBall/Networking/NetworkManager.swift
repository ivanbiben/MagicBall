//
//  NetworkManager.swift
//  MagicBall
//
//  Created by Biben on 31.01.2022.
//

import Foundation

class NetworkManager{
    
    private let baseUrl = "https://8ball.delegator.com/magic/JSON/"
    private let key = "my"
    private let urlSession = URLSession.shared
    
    func fetchRequest<T: Codable>(
        complition: @escaping(_ res: Result<T>) -> Void){
            
            let fullUrlString = baseUrl.appending("\(key)")
            
            guard let url = URL(string: fullUrlString) else {
                return
            }
            
            urlSession.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    complition(.error("Data is Empty"))
                    return
                }
                
                if error != nil {
                    complition(.error(error?.localizedDescription ?? ""))
                    return
                }
                
                let decoder = JSONDecoder()
                guard let responseAnswer: T = try?
                        decoder.decode(T.self,
                                       from: data)
                else {
                    complition(.error("Parsering error"))
                    return
                }
                complition(.succ(responseAnswer))
            }.resume()
        }
    }
