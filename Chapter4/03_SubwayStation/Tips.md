## HTTP Protocol 연결하기
- App Transport Security(ATS)는 iOS9 부터 도입된 개인정보보호 기능
- HTTP 통신을 위해서 해당 설정을 해제하여야 함
 <br>
 
1. info.plist의 Information Property List에 **App Transport Security Settings** 추가
   <br>
  ![image](https://user-images.githubusercontent.com/46417892/152961715-dfefa3fc-771a-4f6a-9bff-b1dd329b7bf8.png)
2. App Transport Security Settings 하위에 **Allow Arbitrary Loads** 속성을 추가하여 Value를 YES로 변경
   <br>
   ![image](https://user-images.githubusercontent.com/46417892/152961673-3df422d4-b542-4353-8dd8-46233489c4db.png)
