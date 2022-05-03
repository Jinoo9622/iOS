## UITabBarController(UIKit) vs TabView(SwiftUI)
- [참고](https://github.com/Jinoo9622/iOS/blob/master/Chapter5/03_CafeApp%26SwiftUI/Samples/UITabBarController_TabView.playground/Contents.swift)

## List vs LazyHStack
- HStack
  - 초기화 시점에 **모든 View를 생성**함
- LazyHStack
  - **초기화 시점에 모든 Cell을 생성하지 않음**
  - **최대 index 31까지**의 데이터의 Cell(View)를 생성 
- List
  - **초기화 시점에 모든 Cell을 생성하지 않음**
  - **UITableView와 비슷**. 보여질 필요가 있는 Cell(View)만 생성
