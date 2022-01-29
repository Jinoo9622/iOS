## Share Sheet
- 공유하기 버튼 탭 시, 다른 앱 or AirDrop을 통해 공유하고자 하는 컨텐츠를 공유할 수 있는 기능
- 기본앱 이외에 다른 앱에서도 다양하게 사용
  - 기본앱
  
    <img src="https://user-images.githubusercontent.com/46417892/151651031-a380a8eb-fe19-4ec1-ba17-17a1894d4ee7.PNG" width="400" height="866"/>
    <img src="https://user-images.githubusercontent.com/46417892/151651034-294f33fe-9668-4fa4-847d-8bdf96ee62e7.PNG" width="400" height="866"/>

  - 별도앱 (ex. Youtube, 네이버지도)
 
    <img src="https://user-images.githubusercontent.com/46417892/151651044-31357d81-fda6-42cc-9949-210033aeecc0.PNG" width="400" height="866"/>
    <img src="https://user-images.githubusercontent.com/46417892/151651050-93b343a3-7993-4945-ad5d-3d1f3c61c374.PNG" width="400" height="866"/>

## UIActivityViewController
- AirDrop, SMS, 이메일 등 다른 앱으로 공유할 수 있는 Share Sheet UIViewController
- URL등 공유할 컨텐츠 (activityItems: [Any])와 타입은 개발자가 지정 가능  
- AirDrop, Safari등 공유될 목적지 (applicationActivities: [UIActivity]?) 또한 개발자가 지정 가능
- 고려사항
  1. 어떤 컨텐츠를 User가 공유시킬수 있도록 할 것인지
  2. 어떤 앱을 우선순위로 공유 or 제외 할 것인지
  <br>
  
  ```swift
  // activityItems: [Any] -> 앱에서 공유할 콘텐츠 (앱 상세화면으로 이동할 URL)
  // applicationActivities: [UIActivity]? -> 공유될 목적지 (iOS 기본 메시지 앱 등)
  init(activityItems: [Any], applicationActivities: [UIActivity]?)
  ```
  
- 참고 : https://developer.apple.com/documentation/uikit/uiactivityviewcontroller
