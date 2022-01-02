###  HTTP
- Hyper Text Transfer Protocol
- Method
  - GET : 클라이언트가 서버에 리소스를 요청할 때 사용
  - POST : 클라이언트가 서버의 리소스를 새로 만들 때 사용
  - PUT : 클라이언트가 서버의 리소스를 전체 수정할 때 사용
  - PATCH : 클라이언트가 서버의 리소스를 일부 수정할 떄 사용
  - DELETE : 클라이언트가 서버의 리소스르 삭제할 때 사용
  - HEAD : 클라이언트가 서버의 정상 작동 여부를 확일할 때 사용
  - OPTIONS : 클라이언트가 서버에서 해당 URL이 어떤 method를 지원하는지 확인할 때 사용
  - CONNECT : 클라이언트가 프록시를 통하여 서버와 SSL 통신을 하고자할 때 사용
  - TRACE : 클라이언트와 서버간 통신 관리 및 디버깅할 때 사용
- HTTP Status
  - 100번대 Informational : 요청 정보를 처리 중 (거의 미사용)
  - 200번대 Success : 요청을 정상적으로 처리함
  - 300번대 Redirection : 요청을 완료하기 위해 추가 동작 필요
  - 400번대 Client Error : 서버가 요청을 이해하지 못함
  - 500번대 Server Error : 서버가 요청 처리를 실패함

----

## URLSession
- 특정한 url을 이용하여 데이터를 다운로드하고 업로드하기 위한 API
- app에서 server와 통신하기위해 제공되는 API
- URLSessionConfiguration통해 생성 가능 / 1개 이상의 URLSessionTask를 생성할 수 있음
  - URLSessionConfiguration : URL 세션에 대한 동작 및 정책을 정의하는 구성 개체
  - URLSessionTask : 특정 리소스 다운로드와 같이 URLSession에서 수행되는 작업 (Session 설정 이후, 추가 가능)
- Types (URLSession)
  - Shared Session(**URLSession.shared()**) : 공유 세션
    - singleton으로 사용할 수 있고, 기본 요청을 하기 위한 Session
  - Default Session(**URLSession(configuration: .defalut)**) : 기본 세션
    - Shared Session과 유사하게 작동
    - 직접 원하는 설정 가능
    - cache/cookie 인증 등을 디스크에 저장할 수 있음
    - 순차적으로 데이터를 처리하기 위해 delegate 지정 가능
  - Ephemeral Session(**URLSession(configuration: .ephemeral)**) : 임시 세션
    - Default Session과 유사
    - cache/cookie 인증 등을 디스크에 저장하지 않음
    - 메모리에 올려 세션을 연결하며, 세션 만료시 데이터가 사라짐
  - Background Session(**URLSession(configuration: .background)**) : 백그라운드 세션
    - 앱이 실행되지 않는 동안, 백그라운드에서 데이터 업로드 및 다운로드가 가능
- Types (URLSessionTask)
  - URLSessionDataTask : 데이터 객체를 사용하여, 데이터를 요청하고 응답받음 (짧고 빈번한 경우)
  - URLSessionUploadTask : 데이터 객체 or 파일형태의 데이터를 업로드하는 작업을 수행 (앱이 실행되지 않은경우, 백그라운드 업로드 지원)
  - URLSessionDownloadTask : 데이터를 다운로드받아서 파일형태로 저장하는 작업을 수행 (앱이 실행되지 않은경우, 백그라운드 다운로드 지원)
  - URLSessionStreamTask : TCP/IP 연결을 생성할때 사용
  - URLSessionWebSocketTask : Web Socket Protocol을 통해 통신
- URLSession Life Cycle
  1. Session Configuration을 결정하고, Session을 생성
  2. 통신할 URL과 Request 객체를 생성
  3. 사용할 Task를 결정하고, 그에 맞는 Completion Handler나 Delegate method들을 작성
  4. 해당 Task를 실행
  5. Task 완료 후, Completion Handler 클로저 실행
  
  ![bf4501ff-82b2-4dd4-9ec3-243ef0e70d21](https://user-images.githubusercontent.com/46417892/147872338-b364ed50-a6a7-4293-8218-b3d8445dc49a.png)
  
  출처 : https://docs-assets.developer.apple.com/published/c7124fb5d7/bf4501ff-82b2-4dd4-9ec3-243ef0e70d21.png

  

