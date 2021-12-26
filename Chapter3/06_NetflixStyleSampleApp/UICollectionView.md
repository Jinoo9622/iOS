# UICollectionView를 구현하기 위한 Class와 Protocol

|Purpose|Classes/Protocols|
|---|---|
|Top-level containment and management|UICollectionView<br>UICollectionViewController|
|Content management|UICollectionViewDataSource<br>UICollectionViewDelegate|
|Presentation|UICollectionReusableView<br>UICollectionViewCell|
|Layout|UICollectionViewLayout<br>UICollectionViewLayoutAttributes<br>UICollectionViewUpdateItem|
|Flow Layout|UICollectionViewFlowLayout<br>UICollectionViewDelegateFlowLayout|

- **Top-level Containment and Management**
  - UICollectionView / UICollectionViewController
    - 시각적 요소 정의
    - UIScrollView 상속
    - Layout 정보 기반 데이터 표시
     

- **Content Management**
  - UICollectionViewDataSource protocol
    - 필수요소
    - Content 관리 및 Content 표시에 필요한 View 생성
  - UICollectionViewDelegate protocol
    - 선택요소
    - 특정 상황에서 View 동작 custom

- **Presentation**
  - UICollectionViewReusableView / UICollectionViewCell
    - Header, Cell, Footer...
    - 재사용 가능 (성능향상)

- **Layout**
  - UICollectionViewLayout / UICollectionViewLayoutAttributes / UICollectionViewUpdateItem
    - 각 항목 배치 등 시각적 스타일 담당
    - View를 직접 소유하지 않는 대신, Attributes 생성
    - 데이터 항목 수정(삽입/삭제/이동) 시, UpdateItem 인스턴스 수신

- **Flow Layout**
  - UICollectionViewFlowLayout / UICollectionViewDelegateFlowLayout
    - Grid, line-based layout 구현
    - Layout 정보를 동적으로 custom

  ![image](https://user-images.githubusercontent.com/46417892/147404263-7510fea5-163b-4216-b2ce-e8d890dba15d.png)
  출처 : https://developer.apple.com/library/archive/documentation/WindowsViews/Conceptual/CollectionViewPGforIOS/CollectionViewBasics/CollectionViewBasics.html 
