//
//  Question.swift
//  Lifehacks (SwiftUI)
//
//  Created by zombietux on 2019/12/07.
//  Copyright © 2019 zombietux. All rights reserved.
//

import Foundation
import UIKit

struct User {
    let name: String
    let aboutMe: String
    let reputation: Int
    let avatar: UIImage
}

struct Question {
    let viewCount: Int
    let title: String
    let body: String
    let creationDate: Date
    let tags: [String]
    let owner: User
    
    private(set) var score: Int
    private(set) var vote = Vote.none
    
    mutating func voteUp() {
        guard self.vote != .up else { return }
        unvote()
        score += vote.rawValue
        self.vote = .up
    }
    
    mutating func voteDown() {
        guard self.vote != .down else { return }
        unvote()
        score += vote.rawValue
        self.vote = .down
    }
    
    mutating func unvote() {
        score -= vote.rawValue
        vote = .none
    }
}

//투표 비지니스 로직
extension Question {
    enum Vote: Int {
        case none = 0
        case up = 1
        case down = -1
    }
}
