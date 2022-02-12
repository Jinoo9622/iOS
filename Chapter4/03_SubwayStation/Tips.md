## HTTP Protocol 연결하기
- App Transport Security(ATS)는 iOS9 부터 도입된 개인정보보호 기능
- HTTP 통신을 위해서 해당 설정을 해제하여야 함
 <br>
 
1. info.plist의 Information Property List에 **App Transport Security Settings** 추가
   <br>
  ![image](https://user-images.githubusercontent.com/46417892/152961715-dfefa3fc-771a-4f6a-9bff-b1dd329b7bf8.png)
2. App Transport Security Settings 하위에 **Allow Arbitrary Loads** 속성을 추가하여 Value를 YES로 변경
   <br>
   ![image](https://user-images.githubusercontent.com/46417892/152961673-3df422d4-b542-4353-8dd8-46233489c4db.png)

## TODO
- 역 이름이 중복되는 경우, 하나만 표시하기
  
  ```swift
  class StationSearchViewController: UIViewController {
      // 생략
      private func requestStationName(from stationName: String) {
          // 생략
          AF.request(urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "").responseDecodable(of: StationResponseModel.self) { [weak self] response in
              guard let self = self,
                  case .success(let data) = response.result else { return }

              // - TODO : 역 이름이 중복되는 경우, 하나만 표시하기
              var stationNames = Set(data.stations.map { $0.stationName })

              self.stations = data.stations.filter {
                  if stationNames.contains($0.stationName) {
                      stationNames.remove($0.stationName)
                      return true
                  }
                  return false
              }

              DispatchQueue.main.async {
                  self.tableView.reloadData()
              }
          }.resume()
       }
       // 생략
  }
  ```
- 도착 정보 표시 후, 1분뒤에 자동으로 서버에 요청하는 코드 구현하기
  ```swift
  class StationDetailViewController: UIViewController {

      private var timer: Timer?

      override func viewDidLoad() {
          super.viewDidLoad()

          // TODO : 도착 정보 표시 후, 1분뒤에 자동으로 서버에 요청하는 코드 구현하기
          // 60초마다 반복적으로 fetchData 실행
          timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(fetchData), userInfo: nil, repeats: true)
          fetchData()
      }

      override func viewDidDisappear(_ animated: Bool) {
          super.viewDidDisappear(animated)
          // 화면 이동 시, timer 정지 처리
          timer?.invalidate()
      }
  }
  ```
