## Remote Notification


## APNS (Apple Push Notification Service)
- Apple 장치에 설치된 응용 프로그램에 알림 데이터를 보낼 수 있도록 하는 플랫폼 알림 서비스
- 전달 순서
  - Provider(Server) -> APNS -> Device -> Application(Notification) 
 
   ![remote_notif_simple_2x](https://user-images.githubusercontent.com/46417892/147224243-ceb1133e-7a8a-42e1-89d5-09d1bea55cd3.png)
    출처 : https://developer.apple.com/library/archive/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/APNSOverview.html
- 동작방식
  - 등록
    1. Push 받을 앱이 APNs에 device Token을 요청
    2. 앱은 APNs로부터 전달받은 Token을 Push Service Provider에게 알림
  - Push 알림
    1. Push Service Provider는 APNs에 data(push content)와 device Token을 전달
    2. APNs는 해당 data를 device Token과 매칭되는 device에 data 전달
    3. 해당 device(앱)에서 Push 알림(Remote Notification) 생성
    
    ![image](https://user-images.githubusercontent.com/46417892/147226479-42052436-7efb-405d-ad6d-06fa538f3d5a.png)
    출처 : https://developer.apple.com/library/archive/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/APNSOverview.html
