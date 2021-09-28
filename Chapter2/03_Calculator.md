## UIStackView
- 열 or 행에 view들의 묶음을 배치할 수 있는 간소화된 인터페이스

![stackview](https://user-images.githubusercontent.com/46417892/135066176-fecbbc4d-2e83-4ec2-975b-57f214ebbfa7.png)

출처 : https://hyunndyblog.tistory.com/148
- 속성
    - Axis : StackView의 방향을 결정 (가로 or 세로)
    - Distribution : StackView안에 들어가는 뷰들의 사이즈를 어떻게 분배할지 설정하는 속성
        - fill : StackView를 채우도록 subview들의 크기를 조정
        - fill equally : StackView를 채우도록 subview들의 크기를 axis를 기준으로 동일하게 조정
        - fill proportionally : StackView의 subview들의 기존 크기에 비례하게 공간을 채움.
        - equal spacing : subview 사이의 간격을 동일하게 조정
        - equal centering : 각 subview의 center간의 거리가 동일하게 조정
    - Alignment : StackView의 subview들을 어떤식으로 정렬할지 결정하는 속성
        - fill : StackView의 방향(axis)이 horizontal인 경우 상하 공간을 채우도록 subview들의 크기를 조정 / vertical인 경우 좌우 공간을 채우도록 subview들의 크기를 조정
        - leading : StackView의 leading에 맞춰 정렬
        - top : StackView의 top에 맞춰 정렬
        - first baseline : subview들의 first baseline에 맞춰 정렬 (horizontal인 경우에만 사용가능)
        - center : subview들의 center를 StackView의 center에 맞춰 정렬
        - trailin : StackView의 trailing에 맞춰 정렬
        - bottom : StackView의 bottom 맞춰 정렬
        - last baseline : subview들의 last baseline에 맞춰 정렬 (horizontal인 경우에만 사용가능)
    - Spacing : StackView안에 들어가는 view들의 간격을 조정하는 속성
