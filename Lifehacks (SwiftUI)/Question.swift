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
        cast(vote: .up)
    }
    
    mutating func voteDown() {
        cast(vote: .down)
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

private extension Question {
    mutating func cast(vote: Vote) {
        guard self.vote != vote else { return }
        unvote()
        score += vote.rawValue
        self.vote = vote
    }
}
