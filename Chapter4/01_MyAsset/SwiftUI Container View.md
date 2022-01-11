## Stack
- Stack View: 자식 View를 한번에 load
  -> layout을 빠르고 안정적이게 보여줄 수 있(시스템이 미리 계산)
- Lazy Stack View: 하위 View가 표시(보여질) 때만 정확한 위치 및 사이즈 계산
- scroll view를 포함하지 않음
  -> contents가 view를 넘어가는 경우, scroll view 내에 stack container 추가

  - StackView
  ![image](https://user-images.githubusercontent.com/46417892/148922470-1a04aba3-3bb1-47c1-b5fc-0e87e7789b2b.png)

  출처 : https://docs-assets.developer.apple.com/published/ce0ca452c3bcccf11149a8728f1c489f/10600/Building-Layouts-with-Stack-Views-1@2x.png

  - Lazy StackView
  ![image](https://user-images.githubusercontent.com/46417892/148922746-cb6d5941-df7c-4398-a76c-8038a0b32c9a.png)
  
  출처 : https://docs-assets.developer.apple.com/published/11e35ee58bbcc2fe0e58e4add7ff42d1/10600/Picking-Container-Views-for-Your-Content-2@2x.png
  
  
## Grid
- 정사각형 container에 자연스럽게 표시되는 컨텐츠를 layout하는데 적합
- 더 큰 디바이스에 표시하기위해, user interface layout을 확장하는데 이용
- scroll view를 포함하지 않음
  -> contents가 view를 넘어가는 경우, scroll view 내에 grid container 추가

  ![image](https://user-images.githubusercontent.com/46417892/148922909-c6e63a87-e50c-424f-a2b3-3b8906c77369.png)

  출처 : https://docs-assets.developer.apple.com/published/ad1dd58b588799bee3436a09dc5306d3/10600/Picking-Container-Views-for-Your-Content-3@2x.png
  
## List
- 항목을 삽입하고, 재정렬하고, 제거하는 등 일반적인 작업에 대한 platform에 적합한 interaction 제공
  ex) 슬라이드로 삭제
- 각 행은 lazy하게 loading
- scroll view를 포함

## Form
- setting 등의 화면을 

  ![image](https://user-images.githubusercontent.com/46417892/148923041-439b0cab-ccda-4b66-a7d8-fe5e9ea8b7d3.png)

  출처 : https://docs-assets.developer.apple.com/published/624bd221651ed358c66daa08c3cfb6bf/10600/Picking-Container-Views-for-Your-Content-4@2x.png
