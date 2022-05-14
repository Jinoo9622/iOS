## UITabBarController(UIKit) vs TabView(SwiftUI)
- [참고](https://github.com/Jinoo9622/iOS/blob/master/Chapter5/03_CafeApp%26SwiftUI/Samples/UITabBarController_TabView.playground/Contents.swift)

## List vs LazyHStack
- HStack
  - 초기화 시점에 **모든 View를 생성**함
    ```swift
    // HStack
    struct SampleHStack: View {
        var body: some View {
            ScrollView(.horizontal) {
                HStack {    // 개별 componet로는 10개까지 사용 가능
                    Text("HStack 알아보기")
                    Text("HStack 알아보기")
                    Text("HStack 알아보기")
                    Text("HStack 알아보기")
                    Text("HStack 알아보기")
                    Text("HStack 알아보기")
                    Text("HStack 알아보기")
                    Text("HStack 알아보기")
                    Text("HStack 알아보기")
                    Text("HStack 알아보기")
                }
            }
        }
    }

    struct SampleHStack_Previews: PreviewProvider {
        static var previews: some View {
            SampleHStack()
        }
    }
    ```
- LazyHStack
  - **초기화 시점에 모든 Cell을 생성하지 않음**
  - **최대 index 31까지**의 데이터의 Cell(View)를 생성 (초기)
  - 이후에는 보여질 필요가 있는 Cell(View)를 생성
    ```swift
    // LazyHStack
    struct SampleLazyHStack: View {
        struct Number: Identifiable {   // ForEach를 사용하기 위해서는, Identifiable Protocol을 따라야함
            let value: Int
            var id: Int { value }
        }
        let numbers: [Number] = (0...100).map { Number(value: $0) }

        var body: some View {
            ScrollView(.horizontal) {
                LazyHStack {    // HStack 자체에는 Scroll 기능이 없음
                    ForEach(numbers) { number in
                        Text("\(number.value)")
                    }
                }
            }
        }
    }

    struct SampleLazyHStack_Previews: PreviewProvider {
        static var previews: some View {
            SampleLazyHStack()
        }
    }
    ```
- List
  - **초기화 시점에 모든 Cell을 생성하지 않음**
  - **UITableView와 비슷**. 보여질 필요가 있는 Cell(View)만 생성
  - **Cell의 삭제/추가 기능이 있음**
    ```swift
    // List
    struct SampleList: View {
        struct Number: Identifiable {
            let value: Int
            var id: Int { value }
        }
        let numbers: [Number] = (0...100).map { Number(value: $0) }

        var body: some View {
            List {  // Scroll 기능을 기본적으로 가지고있음
                ForEach(numbers) { number in
                    Text("\(number.value)")
                }
            }
        }
    }

    struct SampleList_Previews: PreviewProvider {
        static var previews: some View {
            SampleList()
        }
    }
    ```
