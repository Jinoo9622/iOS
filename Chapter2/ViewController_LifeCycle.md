## ViewController Life Cycle
![lifecycle](https://user-images.githubusercontent.com/46417892/134887388-682199b6-3403-4f52-81ed-03d8db216372.png)

출처 : https://hururuek-chapchap.tistory.com/119

- Appearing : 뷰가 화면에 나타나는 중
- Appeard : 뷰가 화면에 나타나는게 완료된 상태
- Disappearing : 뷰가 화면에서 사라지는 중
- Disappeard : 뷰가 화면에서 사라진 상태

----

### viewDidLoad()
- view controller의 모든 view들이 메모리에 로드됐을때 호출
- 메모리에 처음 로드될 때 **한번만** 호출
- 보통 딱 한번 호출될 행위들을 이 method안에 정의함
- view와 관련된 추가적인 초기화 작업, 네트워크 호출 등

### viewWillAppaer()
- view가 view 계층에 추가되고, 화면에 보이기 직전에 **매번** 호출
- 다른 view로 이동했다가 돌아오면 **재호출**
- view와 관련된 추가적인 초기화 작업

### viewDidAppear()
- view controller의 view가 view 계층에 추가된 후 호출됨
- view를 나타낼 때 필요한 추가 작업
- 애니메이션을 시작하는 작업

### viewWillDisappear()
- view controller의 view가 view 계층에서 사라지기 전에 호출
- view가 생성된 뒤 작업한 내용을 되돌리는 작업
- 최종적으로 **데이터를 저장**하는 작업

### viewDidDisappear()
- view controller의 view가 view 계층에서 사라진 뒤에 호출
- view가 사라지는 것과 관련된 추가 작업
