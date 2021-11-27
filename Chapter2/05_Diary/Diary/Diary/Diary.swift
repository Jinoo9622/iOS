//
//  Diary.swift
//  Diary
//
//  Created by 박진우 on 2021/11/09.
//

import Foundation

struct Diary {
    var uuidString: String  // 일기 고유값
    var title: String       // 제목
    var contents: String    // 내용
    var date: Date          // 날짜
    var isStar: Bool        // 즐겨찾기 여부
}
