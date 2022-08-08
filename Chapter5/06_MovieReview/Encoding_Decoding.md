## decodeIfPresent(_:forKey:)
- decoding 할 경우, 해당 key값이 있는지 없는지 확실하지 않을 때 사용

- ex) Movie.swift
  ```swift
  struct Movie: Codable {
    // ...    
    private enum CodingKeys: String, CodingKey {
        // 네이버 api로 넘어오는 값들
        case title, image, userRating, actor, director, pubDate
        // 네이버 api로 넘어오지는 않지만, userDefaults에서 불러와야하는 값
        case isLiked
    }
    
    // isLiked(즐겨찾기)를 추가하기위해 init method 추가
    // - isLiked는 response data에 포함되어있지 않기에, default = false로 설정
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        title = try container.decodeIfPresent(String.self, forKey: .title) ?? "-"
        userRating = try container.decodeIfPresent(String.self, forKey: .userRating) ?? "-"
        actor = try container.decodeIfPresent(String.self, forKey: .actor) ?? "-"
        director = try container.decodeIfPresent(String.self, forKey: .director) ?? "-"
        pubDate = try container.decodeIfPresent(String.self, forKey: .pubDate) ?? "-"
        image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        // isLiked = false로 할 경우, userdefaults에서 불러오는 경우에도 false로 불러오기에, decodeIfPresent 사용
        // -> api로 가져오는 경우에는 해당 키값이 없기에 해당 값이 false로 setting되고, userdefaults에서 가져오는 경우에는 해당 키값이 있기에, 실제 값을 decoding하여 해당 값 setting
        isLiked = try container.decodeIfPresent(Bool.self, forKey: .isLiked) ?? false
        // isLiked = false
    }
    // ...
  }
  ```
