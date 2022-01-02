## OSI (Open Systems Interconnection) Model
- 국제표준화기구(ISO)에서 개발한 모델로, 컴퓨터 네트워크 프로토콜 디자인과 통신을 계층으로 나누어 설명한 것

  ![image](https://user-images.githubusercontent.com/46417892/147870935-7343cf1f-6539-453d-b8d9-2884c278d4f2.png)
  
  출처 : https://www.networkingreviews.com/images/osi-model-7-layers.png
  
  - 1 Level : Physical layer
    - 네트워크의 기본 네트워크 하드웨어 전송 기술
    - 전압 레벨, 데이터 속도, 최대 전송 거리, 커넥터...
    - 케이블, 모뎀, 리피터
  - 2 Level : Data Link layer
    - 신뢰성있는 전송을 보장
    - 데이터를 전달하고, 물리 계층에서 발생할 수 있는 오류를 찾아 내고, 수정하는 데 필요한 기능적, 절차적 수단을 제공
    - MAC address
  - 3 Level : Network Layer
    - 논리 주소를 정의 (경로를 찾아주는 역할)
    - 라우팅, 흐름 제어, 세그멘테이션(segmentation/desegmentation), 오류 제어, 인터네트워킹(Internetworking)등을 수행
    - IP Address
  - 4 Level : Transpot Layer
    - 데이터 흐름 제어 (데이터가 안정적으로 전달될 수 있도록 제어)
      - TCP : 데이터 전달 시, 전달여부를 확인하고 무조건 결과를 보장 (데이터들의 전송이 유효한지 확인하고 전송 실패한 데이터들을 다시 전송)
      - UDP : 데이터 전달 시, 전달여부를 확인하지 않음 (결과보장 X)
  - 5 Level : Session Layer
    - 통신을 관리하기 위한 방법을 제공
    - 통신 장치간의 상호작용 설정, 유지, 관리
  - 6 Level : Presentation Layer
    - 7 Level에 적용되는 데이터 형식, 코딩, 변환 기능 (ex. file extension)
    - 인코딩이나 암호화 등의 동작
  - 7 Level : Application Layer
    - 응용 프로세스와 직접 관계하여 일반적인 응용 서비스를 수행
    - 앱 상의 네트워크
    - HTTP

- Network의 기본 모델
  - encapsulation & decapsulation 과정
  - Sending : 각각의 layer에서 인식할 수 있는 header를 추가
  - Receiving : 각각의 layer에서 인식할 수 있는 header를 제거
    
    ![osi](https://user-images.githubusercontent.com/46417892/147871011-1a911957-085c-4913-bece-84cc4efe07cc.gif)
    
    출처 : https://www.networkingreviews.com/images/osi.gif
 
## URL (Uniform Resource Locater)
- 네트워크 상에서 자원이 어디 있는지를 알려주기 위한 규약
- 웹 사이트 주소뿐만 아니라 컴퓨터 네트워크상의 자원을 모두 나타낼 수 있음
- 표현방법
  ```
  scheme://<user>:<password>@<host>:<port>/<url-path>
  ```
