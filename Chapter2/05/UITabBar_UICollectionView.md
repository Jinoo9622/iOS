## UITabBar
- 앱에서 서로 다른 하위작업, 뷰, 모드 사이의 선택을 할 수 있도록, 탭바에 하나 혹은 하나 이상의 버튼을 보여주는 컨트롤

### UITabBarController
- 다중 선택 인터페이스를 관리하는 컨테이너 뷰 컨트롤러로, 선택에 따라 어떤 자식 뷰 컨트롤러를 보여줄 것인지가 결정

  ![UITabBarController](https://user-images.githubusercontent.com/46417892/138852854-3c6f754f-ca13-4073-8955-1645de35330f.png)
  출처 : https://developer.apple.com/documentation/uikit/uitabbarcontroller



## UICollectionView
- 데이터 항목의 정렬된 컬렉션을 관리하고 커스텀한 레이아웃을 사용해 표시하는 객체
- Layout 객체를 통해 collectionView 내의 아이템 배치 및 시각적 스타일을 결정
- 구성요소
  - Cell : 컬렉션 뷰의 컨텐츠를 표시
  - Supplementary View : 섹션에 대한 정보를 표시 (optional)
  - Decoration View : 컬렉션 뷰에 대한 배경을 꾸밀 때 사용

  ![UICollectionView](https://user-images.githubusercontent.com/46417892/138853685-75a666d1-8a0d-40e6-bb4b-668be9378362.png)
  출처 : https://developer.apple.com/documentation/uikit/uicollectionview
 
### UICollectionViewLayout
- 레이아웃 객체는 컬렉션 뷰의 경계 내에서 Cell, Supplementary View 및 Decoration View의 배치를 결정하고 해당 정보를 컬렉션 뷰에게 제공

### UICollectionViewFlowLayout
- UICollectionViewLayout의 한 유형으로, 이를 이용하면 UICollecionView에서 항목들을 정렬할 수 있음
- cell의 선형 경로를 배치

  ![collectionviewflowlayout](https://user-images.githubusercontent.com/46417892/138855584-f2409d6a-c0a5-4036-bd4e-76e6d27dfa59.png)
  출처 : https://developer.apple.com/documentation/appkit/nscollectionviewflowlayout
 
- 구성단계
  1. FlowLayout 객체를 작성하고, 컬렉션 뷰에 이를 할당한다.
  2. **셀의 width, height를 정한다.** (default가 0이기에 꼭 width, height 지정)
  3. 필요한 경우, 셀들간의 좌우 최소 간격, 위아래 최소 간격을 설정한다.
  4. 섹션에 header와 footer가 있다면, 이것들의 크기를 지정한다.
  5. layout의 스크롤 방향을 설정한다
