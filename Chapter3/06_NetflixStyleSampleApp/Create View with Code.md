## Code로 View 구성 시 (Storyboard X)
1. info.plist의 Storyboard 정보 제거
  1.1 Main storyboard file base name 제거
  1.2 Application Scene Manifest -> Scene Configuration -> Application Session Role -> Storyboard Name 제거 (SceneDelegate 사용 시)
  
  ![image](https://user-images.githubusercontent.com/46417892/148037038-94d8c992-8b19-4270-a2a1-b24befa013fa.png)

2. AppDelegate or SceneDelegate에 RootViewController 설정
   ```swift
   //AppDelegate
   class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
        return true
    }
    ...
   }
   
   // SceneDelegate
   class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        let rootViewController = UIViewController()
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
     }
     ...
   }
   ```
- window.makeKeyAndVisible(): 해당 window를 keywindow(가장 앞쪽에 배치된 window)로 설정
