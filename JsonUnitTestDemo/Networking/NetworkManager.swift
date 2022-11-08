//
//  NetworkManager.swift
//  JsonUnitTestDemo
//
//  Created by Hollis Kwan on 11/8/22.
//

import Foundation

class NetworkManager {
    
    let baseUrl = URL(string: "https://dummyjson.com/")
    let endPoint = "products/1"
    
    func fetchAPI() {
        guard let url = baseUrl?.appending(path: endPoint) else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(JsonTestModel.self, from: data)
                    print(jsonData)
                } catch {
                    print(error)
                }
            }
        }).resume()
    }
}
