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


## FCM (Firebase Cloud Messaging)
- Android, iOS 및 웹 애플리케이션용 메시지 및 알림을 위한 크로스 플랫폼 클라우드 솔루션
- FCM에서 호스팅하는 서버의 알림 또는 메시지를 플랫폼 사용자 또는 최종 사용자에게 보냄
- 주요기능 
  - 원격 알림메시지 전송 : 사용자에게 표시되는 알림 메시지를 실시간 또는 예약 전송
  - 다양한 메시지 타겟팅 : 단일 기기, 기기 그룹, 주제를 구독한 기기
  - 발송 메시지 저장, 관리 : 알림 내용, 상태, 플랫폼, 최종 전송 시간, 열람율 관리
