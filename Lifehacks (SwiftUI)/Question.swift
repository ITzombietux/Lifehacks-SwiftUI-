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
    let score: Int
    let viewCount: Int
    let title: String
    let body: String
    let creationDate: Date
    let tags: [String]
    let owner: User
}

//투표 비지니스 로직
extension Question {
    enum Vote: Int {
        case none = 0
        case up = 1
        case down = -1
    }
}
