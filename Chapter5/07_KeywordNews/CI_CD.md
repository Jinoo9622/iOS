## CI/CD
- CI: Continuous Integration 
  - 지속적 통합, 빌드, 테스트
  - 개발팀이 작은 코드 변경을 수시로 구현해 버전 제어 Repository에 체크인 하도록 유도하는 코드 원칙이자 일련의 방식

- CD: Continuous Delivery
  - 지속적 배포
  - CI가 끝나는 지점부터 시작되며, 프로덕션, 개발, 테스트 환경을 포함해 선택한 환경으로 애플리케이션을 제공하는 과정을 자동화함

- CI/CD: 개발팀이 더 자주, 안정적으로 코드 변경을 제공하기 위해 사용하는 문화와 운영 원칙, 일련의 작업 방식으로 구성됨.

[출처](https://www.ciokorea.com/insider/233289)

![cicd](https://user-images.githubusercontent.com/46417892/190387301-f84e5102-5237-4d07-ae5f-91ae820d9c31.png)
(이미지 출처: https://velog.io/@cham/CICD-CICD%EB%9E%80)     


## Bitrise
- GitHub을 통해 **XCode Project를 가져와서** Bulid에 문제가 없는지, Test가 잘 작동되는지 확인하고(CI) 배포까지(CD) 시켜주는 **CI/CD 서비스**
- 구축 순서
  1. Push or Pull Request 등을 Bitrise에서 자동으로 인식하도록 구축
  2. 개발자가 미리 해둔 설정에 따라 빌드 or 테스트가 자동으로 실행되도록 구축
  3. 실행된 빌드 or 테스트 결과에 따른 동작이 실행되도록 구축 (ex. 성공 -> 배포 / 실패 -> 개발자에게 알림)
     <br>결과에 따라 계속적인 개발 진행 
