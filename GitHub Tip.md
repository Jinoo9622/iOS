## git Setting
1. GitHub 로그인 정보를 Local에 설정
  ```
  $ git config --global user.name "유저이름"
  $ git config --global user.email "유저이메일"
  ```
  - Git config 설정 확인
  ```
  $ cat ~/.gitconfig
  ```
2. Remote Repository와 Local Repository를 연결
  2.1 Repository 생성 
    ```
    $ git init
    
    $ git add .
    $ git commit -m "commit 메시지"
    ```
    
  2.2 Local Repository와 Remote Repository 연결
  ```
  $ git remote add origin Repository주소
  $ git commit -v
  ```
3. Local Repository를 Remote Repository로 Push
  ```
  $ git push origin master
  ```

- 주요 명령어
  - $ git checkout -b **브랜치 이름** : Git Branch 생성
  - $ git checkout **브랜치 이름** : 특정한 이름의 Git Branch 이동
  - $ git add . : 전체 파일 수정을 추가
  - $ git add **파일** : 특정한 파일 수정을 추가
  - $ git commit -m **commit message** : 추가한 수정으로 Commit 생성
  - $ git pull origin **브랜치 이름** : Remote Branch의 최신 내용을 가져옴
  - $ git push origin **브랜치 이름** : Local Branch의 최신 내용을 업로드

### git token 생성 (2021년 8월 13일 이후..)
- git push 시 오류 발생
  <br>
  
    ![image](https://user-images.githubusercontent.com/46417892/155102046-674be26e-6860-4a61-ab43-2d6e7b6a4353.png)
    
- 해결방법
  
  1. git 게정의 **Settings** 선택 <br>
     
     ![image](https://user-images.githubusercontent.com/46417892/155102298-83daa35a-3e42-402c-861c-a491a2493bb5.png)
 
  2. 하단의 **Developer settings** 선택 <br>
     
     ![image](https://user-images.githubusercontent.com/46417892/155102497-60a58ea2-3e42-4aed-8d46-f89af301541f.png)

  3. **Personal access tokens** 선택 후, **Generate new token** 버튼 클릭 <br>
     
     ![image](https://user-images.githubusercontent.com/46417892/155102894-727935df-a2ba-49a3-a291-e360cd9f4cc9.png)

  4. Token의 이름, 만료일, 권한 선택 후 하단의 **Generate token** 버튼 클릭 <br>

     ![image](https://user-images.githubusercontent.com/46417892/155103212-636ace9f-566a-41ee-9551-2ed664bb88b6.png)

  5. Token 복사 **(생성된 Token은 이후에 볼수 없기에 꼭!!!! 복사)** <br>

     ![image](https://user-images.githubusercontent.com/46417892/155103844-afd59f32-a5a0-4c0a-b62a-b57a93e30b39.png)

  6. git push 시, password 대신 복사한 token 입력 <br>

     ![image](https://user-images.githubusercontent.com/46417892/155103987-30fe511b-9bc3-4b26-afa4-422492708f51.png)
     
  7. 정상적으로 push 됨 <br>

     ![image](https://user-images.githubusercontent.com/46417892/155104168-c6d0abac-8637-4029-9366-323b8e9670cc.png)

