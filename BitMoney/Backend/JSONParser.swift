//
//  JSONParser.swift
//  BitMoney
//
//  Created by Hadi Chaaban on 2/6/23.
//

import SwiftUI

struct Scenario: Codable {
    var title: String
    var choiceArr: [Choice]
    var status: [Status]
    
    static let allScenarios: [String: Scenario] = Bundle.main.decode(file: "scenarios.json")
}

struct Choice: Codable {
    var title: String
    var outcome: Int
    var scenario: String?
}

enum Status: String, Codable, CaseIterable {
    case health
    case social
    case hunger
    case happiness
    
//    var color: Color {
//        switch self {
//
//        case .health:
//            return .red
//        case .social:
//            return .blue
//        case .hunger:
//            return .green
//        case .happiness:
//            return .yellow
//        }
//    }
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
