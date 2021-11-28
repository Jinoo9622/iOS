## Client Server Model
- Client(Frontend) / Server(Backend)

  ![image](https://user-images.githubusercontent.com/46417892/143732435-55ec1c8f-0366-456f-9b6c-bb7d8f6b31aa.png)


  출처 : https://commons.wikimedia.org/w/index.php?curid=15782858

## OAuth
- 사용자 인증 방식에대한 업계 표준
- ID/PW를 노출하지 않고, OAuth를 사용하는 업체의 API 접근 권한을 위임 받음
- 기본 개념
  - User: Service Provider에 계정을 가지고 있는 사용자 
  - Consumer: Service Provider의 API(제공 기능)을 사용하려는 서비스 (web, app..)
  - Service Provider: OAuth를 사용하여 API를 제공하는 서비스
  - Access Token: 인증 완료 후, Service Provider의 제공 기능을 이용할 수 있는 권한을 위임받은 인증 키
  
  ![oauth2-flow](https://user-images.githubusercontent.com/46417892/143732715-95f693b5-17ec-4a14-a987-3ea3a5ed6e8d.png)
 
  출처 : https://velog.io/@denmark-choco/OAuth-2
