//
//  ChineseWords.swift
//  Chinese
//
//  Created by Bingqian Wang on 7/3/23.
//

import Foundation
import SwiftUI

struct ChineseWords: Codable, Identifiable{
    
    var id: Int
    var grade: String
    var description: String
    var isFavorite: Bool
    var category: String
    var lessons: [Lessons]
    enum CodingKeys: String, CodingKey{
        case lessons
        case id = "id"
        case grade
        case description
        case isFavorite
        case category
    }
    
}

struct Lessons: Codable, Identifiable{
    
    var id: Int
    var lesson: String
    var word: String
    var phrases: String
    var isLesFavorite: Bool
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case lesson
        case word
        case phrases
        case isLesFavorite
    }
}
