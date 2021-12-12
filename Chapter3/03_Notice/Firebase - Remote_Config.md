## Remote Config
- 배포없이, 업데이트 다운로드 없이 앱 변경
- 기본값 설정 후, 값 재정의
- 클라우드 기반 key-value 저장소
- 주요기능
  - 앱 사용자층에 변경사항을 빠르게 적용 : 업데이트 없이 앱의 UI/UX 변경 지원
  - 사용자층의 특정 세그먼트에 앱 맞춤설정 : 앱버전, 언어 등으로 분류된 사용자 세그먼트별 환경 제공
  - A/B 테스트를 실행하여 앱 개선 : 사용자 세그먼트별로 개선사항을 검증 후 점진적 적용
  
  ![propagate](https://user-images.githubusercontent.com/46417892/145706276-53983e7e-c6df-44c4-b4ae-f498741c03d1.png)
  출처 : https://firebase.google.com/docs/remote-config/propagate-updates-realtime?hl=ko

## Firebase A/B Testing
- Google Analytics, Firebase 예측을 통한 사용자 타겟팅
- Remote Config or Cloud Messaging 활용
- 제품, 마케팅 실험을 쉽게 실행, 분석, 확장
  
  ![Diagram-AB-Testing-IO-v2](https://user-images.githubusercontent.com/46417892/145706916-cdb5ced0-0422-46f7-8032-fdd8091b04a2.png)
  출처 : https://firebase.google.com/docs/ab-testing
  
