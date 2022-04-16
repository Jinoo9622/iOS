//
//  String+extension.swift
//  SearchDaumBlog
//
//  Created by 박진우 on 2022/04/04.
//

import Foundation

extension String {
    // HTML Tag 제거 (정규식 이용)
    func removeHTMLTag() -> String? {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
