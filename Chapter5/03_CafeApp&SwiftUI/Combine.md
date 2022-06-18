## @State
- String, Int, Bool고 같은 **간단한 값을 저장**하고 **View의 현재 상태를 표시**하기 위해 사용.
- 화면에 표시하기위한 수단
- 화면 내부에서만 사용하기에 private로 선언 (@State private var isDisabled = true)
    
    ```swift
    import SwiftUI
    
    struct ChildView: View {
    //    @State private var currentText = ""
        @State private var isDisabled: Bool

        var body: some View {
    //        VStack {
    //            TextField("텍스트를 입력해주세요.", text: $currentText)   // 값을 binding 시킬 경우 $변수명으로 binding
    //            Text(currentText)
    //        }

            VStack {
                Toggle(isOn: $isDisabled, label: {
                    Text("버튼을 비활성화 시키겠습니까?")
                })

                Button("버튼") {}
                    .disabled(isDisabled)
            }
        }
    }

    struct Sample_Preview: PreviewProvider {
        static var previews: some View {
            ChildView()
        }
    }
    ```

## @Binding
- **ChildView에서 ParentView의 값을 표시**하고, 능동적으로 값이 변화할 때 사용
- **ChildView에서 사용됨.**

    ```swift 
    import SwiftUI

    struct ParentView: View {
        @State private var isDisabled = true

        var body: some View {
            ChildView(isDisabled: $isDisabled)
        }
    }

    struct ChildView: View {
        @Binding var isDisabled: Bool

        var body: some View {
            VStack {
                Toggle(isOn: $isDisabled, label: {
                    Text("버튼을 비활성화 시키겠습니까?")
                })

                Button("버튼") {}
                    .disabled(isDisabled)
            }
        }
    }

    struct Sample_Preview: PreviewProvider {
        static var previews: some View {
            ParentView()
        }
    }
    ```

## @ObservedObject
- [참고](https://developer.apple.com/documentation/swiftui/observedobject)

    ```swift
    import SwiftUI

    class ButtonModel: ObservableObject {
        @Published var isDisabled = true
    }

    struct ParentView: View {
        @ObservedObject var buttonModel = ButtonModel()

        var body: some View {
            ChildView(isDisabled: $buttonModel.isDisabled)
        }
    }

    struct ChildView: View {
        @Binding var isDisabled: Bool

        var body: some View {
            VStack {
                Toggle(isOn: $isDisabled, label: {
                    Text("버튼을 비활성화 시키겠습니까?")
                })

                Button("버튼") {}
                    .disabled(isDisabled)
            }
        }
    }

    struct Sample_Preview: PreviewProvider {
        static var previews: some View {
            ParentView()
        }
    }
    ```
