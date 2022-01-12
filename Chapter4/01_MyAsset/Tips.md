- 다크모드 여부와 관계 없이 항상 Light/Dark mode 설정
  - Info.plist -> Information Property List -> Appearance(추가) -> Dark / Light 입력
  
    ![image](https://user-images.githubusercontent.com/46417892/148925800-9a2c0081-1909-49a9-93e1-4cdaa85ef9ca.png)

- UIKit -> SwiftUI
  - UIKit의 Interface들(ex. UIViewController, UITableViewController, UIView...) 을 SwiftUI로 구현할 경우, UIViewControllerRepresentable 등의 protocol 구현필수.

- UIPageViewController와 UIPageControl 연동 시, @Binding property 선언하여 해당 property 이용
  - 연동된 예시
    ![ezgif-5-ec627c0b6a](https://user-images.githubusercontent.com/46417892/149134879-42f496f9-f481-4c5f-8a21-808092aa383c.gif)

