## Alamofire
- Swift URLSession 기반의 HTTP 네트워킹 라이브러리
- Apple의 Foundation networking 기반으로 인터페이스를 제공하여, 일반적인 네트워킹 작업들을 단순화
- 코드의 간소화, 가독성 측면에서 도움을 주고 여러기능을 직접 구축하지 않아도 쉽게 사용 가능
- 특징
  - Chainable request/response method
  - URL / JSON parameter Encoding
  - File / Data / Stream / MultipartFormData 업로드
  - request/resume data를 이용한 다운로드
  - URLCredential을 통한 인증
  - HTTP response 검증
  - Progress를 사용한 Upload and Download Progress Closurs
  - cURL 디버깅 출력
  - Dynamically Adapt and Retry Requests
  - TLS Certificate and Public Key Pinning
  - Network Reachability
  - Comprehensive Unit and Integration Test Coverage
  - 완벽한 문서화

## Cocoapods
- iOS / macOS / tvOS 등 Apple platform 개발 시, 외부 라이브러리 관리를 용이하게하는 의존성 관리 도구
- 설치
  - 터미널에서 명령어 입력
  
    ```cmd
    sudo gem install cocoapods
    ```
  - cocoapods를 설치할 프로젝트 경로로 이동하여 Podfile 생성
  
    ```cmd
    pod init
    ```
  - 설치할 라이브러리를 입력 후, 
  
    ```cmd
    # Uncomment the next line to define a global platform for your project
    # platform :ios, '9.0'

    target 'project' do
    # Comment the next line if you don't want to use dynamic frameworks
    use_frameworks!

    # Pods for project
     # Alamofire
    pod 'Alamofire'
    # charts
    pod 'Charts'
    end
    ```
  - 라이브러리 설치
  
    ```cmd
    pod install
    ```
  
