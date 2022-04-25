## Testing 과정
1. Test Target 추가

   1. <br>    

      ![image](https://user-images.githubusercontent.com/46417892/165064796-9cc94b80-2e74-416a-8b04-dc341a51182e.png)
   2. <br>

      ![image](https://user-images.githubusercontent.com/46417892/165064849-b374cc3b-ec16-4635-88f9-75dd114d4ab5.png)
   3. Host Application 적용 확인
      ![image](https://user-images.githubusercontent.com/46417892/165065098-39194ab0-78b1-4f3a-8c47-918a13a348b6.png)
 
2. 기존의 Test file 삭제
 
    ![image](https://user-images.githubusercontent.com/46417892/165065619-3b54ae4a-ead5-4984-a145-03f3e110f9c6.png)

3. Test할 file 생성
    ![image](https://user-images.githubusercontent.com/46417892/165065873-5c512b45-c76c-4201-9377-bbfd97255bba.png)
    
    ※ Bridging header에 대한 팝업 시, 필요에따라 생성
4. RxSwift Error 발생 시, cocoapod으로 다음과 같이 설치
   ![image](https://user-images.githubusercontent.com/46417892/165066883-999a4b5a-c555-442c-ba28-d84603da72d6.png)

   ```
   # Uncomment the next line to define a global platform for your project
   # platform :ios, '9.0'

   target 'FindCVS' do
     # Comment the next line if you don't want to use dynamic frameworks
     use_frameworks!

     # Pods for FindCVS
     pod 'RxSwift'
     pod 'RxCocoa'
     pod 'SnapKit'

     target 'FindCVSTests' do
       inherit! :search_paths
       # Pods for testing
       pod 'Stubber'
       pod 'Nimble'
       pod 'RxBlocking'
       pod 'RxTest'
     end

   end
   ```
5. Test file 작성
6. Test 실행
  - Command + U or Build Button을 길게 Click
7. 테스트 결과
  - 성공

    ![image](https://user-images.githubusercontent.com/46417892/165076317-2a3cb795-6b12-49cb-a44c-e630625a2c2b.png)

  - 실패

    ![image](https://user-images.githubusercontent.com/46417892/165076362-cc28e507-2d5e-45c4-b1d4-401fdcd22de3.png)

    
