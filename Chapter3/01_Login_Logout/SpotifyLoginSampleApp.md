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

## Firebase Auth
- 어려운 SignIn 기능을 쉽고 안전하게 : OAuth 2.0, OpenID Connect 등의 업계 표준 활용, 삽입형 인증 솔루션 제공
- 다양한 인증 방식 제공 : 이메일/비밀번호, ID 공급업체, 전화번호, 커스텀 인증, 익명 인증
- 별도 Backend 개발 없이 인증 서비스 제공 : Serverless framework


## Apple Signin Setting
- **Apple Developer 가입 후 진행**

1. Xcode -> Targets -> Signing & Capability에 Sign in with Apple 추가
   ![image](https://user-images.githubusercontent.com/46417892/147401782-69a25e27-19bc-48fb-ad7c-c505c6695ad0.png)

2. Apple Developer -> Account -> Certificates, Identifiers & Profiles -> Identifiers에서 Services IDs 추가
3. 생성된 Identifiers -> Configure
   ![image](https://user-images.githubusercontent.com/46417892/147401856-967a5e44-dadd-4ae3-8d20-3ea165e5ef0b.png)
   
   3.1 Domains and Subdomains에 firebaseapp.com url 추가
       ![image](https://user-images.githubusercontent.com/46417892/147401897-d4670702-49eb-421a-8fc2-2f4fd5ace930.png)
       
   3.2 Return URLs에 Apple Sign-in Return URL 추가
       ![image](https://user-images.githubusercontent.com/46417892/147401941-99c9e44b-2733-4dfd-a8f0-da80a965cdf6.png)
