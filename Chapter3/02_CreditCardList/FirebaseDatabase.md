## Firebase Realtime Database & Cloud Firestore
- 공통점
  - 비관계형 클라우드 데이터베이스
  - 실시간 : HTTP 요청이 아닌 동기화 방식
  - 오프라인 : 로컬에 저장 후 네트워크 연결시 동기화
  - NO Server : 데이터베이스와 클라이언트 직접 엑세스
  
- 차이점
  - Realtime Database
    - 하나의 큰 json tree
    - 정렬 || 필터링
    - 깊고 좁은 쿼리
    - data set ↑ 쿼리성능 ↓

  - Cloud Firestore
    - 문서 컬렉션
    - 정렬 && 필터링
    - 얕고 넓은 쿼리
    - data set ↑ 쿼리성능 ?

- 상황별 DB선택
  - Realtime Database
    - 기본적인 데이터 **동기화**
    - **적은양**의 데이터가 자주 **변경**
    - **간단한 json** tree
    - **많은** 데이터베이스

  - Cloud Firesstore
    - **고급 쿼리**, 정렬, 트랜잭션
    - **대용량**의 데이터가 자주 **읽힘**
    - **구조화된 컬렉션**
    - **단일** 데이터베이스  
