//
//  Lifehacks__SwiftUI_Tests.swift
//  Lifehacks (SwiftUI)Tests
//
//  Created by zombietux on 2019/12/07.
//  Copyright © 2019 zombietux. All rights reserved.
//

import XCTest
@testable import Lifehacks__SwiftUI_

//MARK: -Question 모델 테스트 코드
class QuestionTests: XCTestCase {
    func testVoteUp() {
        var question = makeQuestion()
        question.voteUp()
        XCTAssertEqual(question.score, 1)
    }
    
    func testVoteDown() {
        var question = makeQuestion()
        question.voteDown()
        XCTAssertEqual(question.score, -1)
    }
    
    func testUnvote() {
        var question = makeQuestion()
        question.voteUp()
        question.unvote()
        XCTAssertEqual(question.score, 0)
    }
    
    func testVotingOnce() {
        var question = makeQuestion()
        question.voteUp()
        question.voteUp()
        XCTAssertEqual(question.score, 1)
    }
    
    func testReversingVote() {
        var question = makeQuestion()
        question.voteUp()
        question.voteDown()
        XCTAssertEqual(question.score, -1)
    }
}

private extension QuestionTests {
    func makeQuestion() -> Question {
        let user = User(name: "", aboutMe: "", reputation: 0, avatar: UIImage())
        return Question(viewCount: 0, title: "", body: "", creationDate: Date(), tags: [], owner: user, score: 0)
    }
}
