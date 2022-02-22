## git token 생성 (2021년 8월 13일 이후..)
- git push 시 오류 발생
  <br>
  
    ![image](https://user-images.githubusercontent.com/46417892/155102046-674be26e-6860-4a61-ab43-2d6e7b6a4353.png)
    
- 해결방법
  
  1. git 게정의 **Settings** 선택
     <br>
     
     ![image](https://user-images.githubusercontent.com/46417892/155102298-83daa35a-3e42-402c-861c-a491a2493bb5.png)
 
  2. 하단의 **Developer settings** 선택
     <br>
     
     ![image](https://user-images.githubusercontent.com/46417892/155102497-60a58ea2-3e42-4aed-8d46-f89af301541f.png)

  3. **Personal access tokens** 선택 후, **Generate new token** 버튼 클릭
     <br>
     
     ![image](https://user-images.githubusercontent.com/46417892/155102894-727935df-a2ba-49a3-a291-e360cd9f4cc9.png)

  4. Token의 이름, 만료일, 권한 선택 후 하단의 **Generate token** 버튼 클릭 <br>

     ![image](https://user-images.githubusercontent.com/46417892/155103212-636ace9f-566a-41ee-9551-2ed664bb88b6.png)

  5. Token 복사 **(생성된 Token은 이후에 볼수 없기에 꼭!!!! 복사)** <br>

     ![image](https://user-images.githubusercontent.com/46417892/155103844-afd59f32-a5a0-4c0a-b62a-b57a93e30b39.png)

  6. git push 시, password 대신 복사한 token 입력 <br>

     ![image](https://user-images.githubusercontent.com/46417892/155103987-30fe511b-9bc3-4b26-afa4-422492708f51.png)
     
  7. 정상적으로 push 됨 <br>

     ![image](https://user-images.githubusercontent.com/46417892/155104168-c6d0abac-8637-4029-9366-323b8e9670cc.png)

