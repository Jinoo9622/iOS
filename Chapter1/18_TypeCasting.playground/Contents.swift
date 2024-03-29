import UIKit

// 타입 캐스팅 (is, as)
// - 인스턴스의 타입을 확인하거나 어떠한 클래스의 인스턴스를
//   해당 클래스 계층 구조의 슈퍼클래스나 서브클래스로 취급하는 방법

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [     // MediaItem type array
    Movie(name: "기생충", director: "봉준호"),
    Song(name: "Butter", artist: "BTS"),
    Movie(name: "올드보이", director: "박찬욱"),
    Song(name: "Wonderwall", artist: "Oasis"),
    Song(name: "Rain", artist: "이적")
]

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {  // instance의 타입 확인 가능 (is)
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media Library contains \(movieCount) movies and \(songCount) songs.")

// down casting - 형변환 (as)
// as? - 옵셔널 값 리턴 (if let / guard let 구문으로 옵셔널값 추출 가능)
// as! - 강제적 형변환 (런타임 에러 발생 가능)
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}
