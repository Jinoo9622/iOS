## Kakao API
- [참고](https://developers.kakao.com/docs/latest/ko/local/common)
- [카테고리 검색](https://developers.kakao.com/docs/latest/ko/local/dev-guide#search-by-category) / [지도 API](https://apis.map.kakao.com/ios/guide/)

## 지도 API SDK 연동
- Objective-C로 되어있기 때문에 BridgingHeader 추가 필요
  1. BridgingHeader.h 생성 및 <DaumMap/MTMapView.h> import
      ![image](https://user-images.githubusercontent.com/46417892/163712003-bb1d671f-a53c-4155-ba46-1de10172c643.png)
    
  2. Swift Compiler에 BridgingHeader.h Path 추가
      ![image](https://user-images.githubusercontent.com/46417892/163712218-cb3af915-3810-49cc-84ee-08f72023e6fc.png)
 
- DaumMap Framework가 사용하는 Framework들을 추가

  - ![image](https://user-images.githubusercontent.com/46417892/163711974-49f17ad2-ed15-42f1-bd8f-53c7374e2432.png)

- Automatic Reference Counting(ARC) 을 지원하지 않기에, ARC 사용을 NO로 변경

  - ![image](https://user-images.githubusercontent.com/46417892/163712098-fc0efe01-68a6-4755-b2af-d9497429283a.png)
