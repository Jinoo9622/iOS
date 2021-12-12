## Remote Config
- 배포없이, 업데이트 다운로드 없이 앱 변경
- 기본값 설정 후, 값 재정의
- 클라우드 기반 key-value 저장소
- 주요기능
  - **앱 사용자층에 변경사항을 빠르게 적용** : 업데이트 없이 앱의 UI/UX 변경 지원
  - **사용자층의 특정 세그먼트에 앱 맞춤설정** : 앱버전, 언어 등으로 분류된 사용자 세그먼트별 환경 제공
  - **A/B 테스트를 실행하여 앱 개선** : 사용자 세그먼트별로 개선사항을 검증 후 점진적 적용
  
  ![propagate](https://user-images.githubusercontent.com/46417892/145706276-53983e7e-c6df-44c4-b4ae-f498741c03d1.png)
  출처 : https://firebase.google.com/docs/remote-config/propagate-updates-realtime?hl=ko

## Firebase A/B Testing
- Google Analytics, Firebase 예측을 통한 사용자 타겟팅
- Remote Config or Cloud Messaging 활용
- 제품, 마케팅 실험을 쉽게 실행, 분석, 확장
- 주요기능
  - **제품 환경 테스트 및 개선** : 앱 동작 및 모양을 변경하여 최적의 제품 환경 확인
  - **사용자의 재참여를 유도할 방안 모색** : 앱 사용자를 늘리기에 가장 효과적인 문구와 메시징 설정
  - **새로운 기능의 안전한 구현** : 작은 규모의 사용자 집합을 대상으로 원하는 목표를 달성할 수 있는지 확인
  - **'예측된' 사용자 그룹 타겟팅** : 특정 행동을 할 것으로 예측된 사용자에 A/B 테스트를 실시
  
  ![Diagram-AB-Testing-IO-v2](https://user-images.githubusercontent.com/46417892/145706916-cdb5ced0-0422-46f7-8032-fdd8091b04a2.png)
  출처 : https://firebase.google.com/docs/ab-testing
  
  - test device의 condition 변경
    ![KakaoTalk_Photo_2021-12-12-20-17-18](https://user-images.githubusercontent.com/46417892/145710169-899bf964-640a-466d-af1d-ee9752093b81.png)
