# Cocoa touch Framework

- iOS 개발환경을 구축하기위한 최상위 Framework

![Cocoa_Touch_Framework_img](https://user-images.githubusercontent.com/46417892/133990874-6b7de611-572c-4bbb-86b4-18f6f636d7a8.png)



## UIKit

- 사용자의 인터페이스를 관리하고 이벤트를 처리
  - 제스처 처리, 애니메이션, 그림 그리기, 이미지 처리, 텍스트 처리
  - 테이블 뷰, 슬라이더, 버튼 텍스트필드, 알럿창 등 어플리케이션 화면 구성 요소 

- 기본적으로 MVC 디자인 패턴을 사용
 ![ MVC](https://user-images.githubusercontent.com/46417892/133991670-5af39a91-1f03-4614-96c0-c266532b8e6a.png)
 - 출처 : https://ko.wikipedia.org/wiki/%EB%AA%A8%EB%8D%B8-%EB%B7%B0-%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC



## UIView

- 화면의 직사각형 영역에 대한 내용을 관리하는 object
  - 여러 UI componet들의 부모클래스

## ViewController

- 앱의 근간을 이루는 객체
- 모든 앱은 최소한 하나 이상의 View Controller를 가짐 

- ViewController의 주요역할
  - 데이터 변화에 따라 view 컨텐츠를 업데이트
  - view들과 함께 사용자 상호작용에 응답
  - view를 리사이징하고, 전체적인 인터페이스의 레이아웃 관리
  - 다른 view controller들과 함께 앱을 구성


## AutoLayout

- 제약조건(Constraints)를 이용하여 뷰의 위치를 지정하는 것
- iPhone의 다양한 해상도 비율에 대응

----
## Content View Controller
- 화면을 구성하는 뷰를 직접 구현하고, 관련된 이벤트를 처리하는 뷰 컨트롤러

## Container View Controller
- 하나 이상의 Child View Controller를 가지고 있다.
- 하나 이상의 Child View Controller를 관리하고 레이아웃과 화면 전환을 담당한다.
- 화면 구성과 이벤트 관리는 Child View Controller에서 한다.
- Container View Controller는 대표적으로 Navigation Controller와 TapBar Controller가 있다.
### UINavigationController
- 계층구조로 구성된 content를 순차적으로 보여주는 container view controller
- Navigataion Stack을 이용하여 child view controller들을 관리한다.

### Navigation Stack
![stack](https://user-images.githubusercontent.com/46417892/134804169-5347ed05-5910-4948-8c4d-fcddc917ce03.png)

출처 : https://sites.google.com/site/ionic2withangular2/home/understanding-ionic-2-navigation-with-navcontroller

## 화면 전환 방식 (소스코드 이용 / Storyboard 이용)
- view controller의 view위에 다른 view를 가져와 바꿔치기 (일반적으로 사용 X, 메모리 누수의 위험이 있음)
- view controller에서 다른 view controller를 호출하여 전환하기
- Navigation Controller를 사용하여 화면 전환하기
- 화면 전환용 객체 세그웨이(Segueway)를 사용하여 화면 전환하기
    - Action Segueway : 출발점이 Button / Cell 등인 경우 (트리거 이벤트를 통한 화면 전환)
        - Show : Navigation Controller를 사용한 경우, 화면 전환 시, view controller가 stack에 쌓이게 되고, 그렇지 않은 경우에는 present modally와 동일하게 동작
        - Show Detail : split view에서 사용, iPhone의 경우에는 show와 동일하게 동작하나, iPad에서 사용 시, split 구조의 master/slave 구조가 됨
            - ex) Message앱
        - Present Modally : 이전 View Controller를 덮으면서 새로운 화면이 나옴
        - Present As Popover : iPad에서 사용함 (팝업창이 뜨게됨)
        - Custom : 사용자 정의
    - Manual Segueway : 출발점이 ViewController 자체인 경우 (performSegue method 호출)

----

## 화면간 데이터 전달하기
- 코드로 구현된 화면 전환 방법에서 데이터 전달하기
- segueway로 구현된 화면 전환 방법에서 데이터 전달하기
- Delegate 패턴을 이용하여 이전 화면을 데이터 전달하기
