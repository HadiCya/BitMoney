//
//  JSONParser.swift
//  BitMoney
//
//  Created by Hadi Chaaban on 2/6/23.
//

import Foundation

struct Scenario: Codable {
    var id: String
    var title: String
    var choiceArr: [Choice]
    
    static let allScenarios: [Scenario] = Bundle.main.decode(file: "scenarios.json")
}

struct Choice: Codable {
    var title: String
    var outcome: Int
}

extension Bundle{
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project!")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) in the project!")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) in the project!")
        }
        
        return loadedData;
    }
    
}
