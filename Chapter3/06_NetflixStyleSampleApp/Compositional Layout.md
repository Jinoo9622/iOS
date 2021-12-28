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
  
  ![rendered2x-1585241228](https://user-images.githubusercontent.com/46417892/147544677-a16f0891-d981-43af-9244-7498fe64e8a5.png)
  
   출처 : https://developer.apple.com/documentation/uikit/nscollectionlayoutitem
