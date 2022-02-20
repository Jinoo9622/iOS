## 기존 UI Component extension 추가
- 별도의 extension file 생성 후, 작성
  <br>

    ![image](https://user-images.githubusercontent.com/46417892/153744722-55c55a9a-d744-4086-8fff-dae88c3fc30d.png)

## View hierarchy 사용
- view component를 simulator 등으로 확인하기 어려울 경우 사용.
  (ex. tableView Cell의 개수는 10개이나, backgroudColor가 white이고, separatorStyle가 none인 경우)
    <br>
    
    ![image](https://user-images.githubusercontent.com/46417892/153744807-d20117c9-5675-4866-8f19-346183e9c677.png)
    <br>
    
    ![image](https://user-images.githubusercontent.com/46417892/153744829-90f3ea64-cdff-49b0-9533-51da7c235709.png)
    ※ simulator 실행 후, 확인 가능

## UIImage contentMode
- scaleToFill: 이미지의 width, height는 imageView의 width, height와 동일하게 조정
  <br>
  
  ![image](https://user-images.githubusercontent.com/46417892/154256256-429c0d0b-0414-4621-b928-0a85a4c3aa5c.png)

- scaleAspectFill: 이미지의 비율을 유지하면서, imageView를 채움 (image의 특정 부분들은 잘릴 수 있음)
  <br>
  - clipsToBounds = False
    <br>

    ![image](https://user-images.githubusercontent.com/46417892/154256325-ac1369b1-8f4e-4f1f-8232-9d26ec16776a.png)
    
  - clipsToBounds = True
    <br>
    
    ![image](https://user-images.githubusercontent.com/46417892/154256422-6a89f745-17cf-419c-bea5-1743a8e2c3e7.png)

- scaleAspectFit: 이미지의 비율을 유지하면서 imageView의 크기에 맞게 조정 (여백부분은 투명처리)
  <br>
  
  ![image](https://user-images.githubusercontent.com/46417892/154256497-9c5060fc-b93e-4ad1-b36c-d9f03a1007d0.png)


## UIAlertController
- alert
  <br>
  
  ![image](https://user-images.githubusercontent.com/46417892/154256902-b57ddbcd-47a4-4ad6-b5c3-6d6cd32c4a08.png)
  <br>
  
  ![image](https://user-images.githubusercontent.com/46417892/154257602-4706052a-49b6-4c8d-a495-1c18c01571ee.png)

  
- actionSheet
  <br>
  
  ![image](https://user-images.githubusercontent.com/46417892/154256868-41b995cc-871b-4e59-9e4c-3eafd7de5ec5.png)
  <br>
  
  ![image](https://user-images.githubusercontent.com/46417892/154256935-4228d6a1-5d44-4a6b-995d-584758e4da72.png)

## UIImagePickerController
- 사진 앱에 접근하여, 이미지 가져오기
  1. Info.plist에 **Privacy - Photo Library Usage Description** Key 추가
  <br>
  
  ![image](https://user-images.githubusercontent.com/46417892/154832333-0db90421-0674-4a21-9d4f-b83ae50282f1.png)
  
  2. 권한요청
  ```swift
  PHPhotoLibrary.requestAuthorization(for: .readWrite) { [weak self] status in
      guard let self = self else { return }
      switch status {
      case .authorized:
          print("앨범 접근 권한 허용")
          // imagePickerController present는 main thread에서 실행
          DispatchQueue.main.async {  
              self.present(self.imagePickerController, animated: true)
          }
      case .denied:
          print("앨범 접근 권한 거부")
      case .notDetermined, .restricted:
          print("앨범 접근 권한 미정")
      default:
          print("default")
      }
  }
  ```
