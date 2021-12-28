## UICollectionViewCompositionalLayout
- 구성가능 : 복잡한 결과를 단순한 것으로 구성
- 유연성 : 모든 레이아웃을 작성 가능하게
- 속도 : 프레임워크에서 자체 성능 최적화 수행

- ex)
  ```swift
  let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.75))
  // 메인 구성요소
  let item = NSCollectionLayoutItem(layoutSize: size)
  let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
  let section = NSCollectionLayoutSection(group: group)
  
  let layout = NSCollectionViewCompositionalLayout(section: section)
  ```
- Item
  ![rendered2x-1585241228](https://user-images.githubusercontent.com/46417892/147544677-a16f0891-d981-43af-9244-7498fe64e8a5.png)
  
   출처 : https://developer.apple.com/documentation/uikit/nscollectionlayoutitem

- Item > Group
  ![rendered2x-1585241228 (1)](https://user-images.githubusercontent.com/46417892/147546249-0e440041-fe38-4d60-a94b-f4a05e597e70.png)
  
  출처 : https://developer.apple.com/documentation/uikit/nscollectionlayoutgroup
  
- Item > Group > Section
  ![rendered2x-1585241228 (2)](https://user-images.githubusercontent.com/46417892/147546306-3b9d0742-0f88-4a43-85b2-dd33444dc814.png)
  
  출처 : https://developer.apple.com/documentation/uikit/nscollectionlayoutsection

- size type
  - Absolute : 절대적인 값, 정확한 치수
    ```swift
    let absoluteSize = NSCollectionLayoutSize(widthDimension: .absolute(44), heightDimension: .absolute(44))
    ```
  - Estimate : 예상값, run time에 contents 크기가 변경될 수 있는 경우 사용
    ```swift
    let estimatedSize = NSCollectionLayoutSize(widthDimension: .estimated(44), heightDimension: .estimated(44))
    ```
  - Fractional : 비율값, item container를 기준으로 값을 정의
    ```swift
    let fractionalSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(44), heightDimension: .fractionalWidth(44))
    ```
