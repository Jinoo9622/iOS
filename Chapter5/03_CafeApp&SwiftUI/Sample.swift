//
//  Sample.swift
//  Cafe
//
//  Created by 박진우 on 2022/06/06.
//


// UINavigationController = UIKit
import UIKit

let navigationController = UINavigationController(rootViewController: SampleViewController())

final class SampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Title"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "house.fill"),
            style: .plain,
            target: self,
            action: #selector(didTapRightBarButton)
        )
    }
    
    @objc private func didTapRightBarButton() {
        print("Did tap right bar button!")
        navigationController?.pushViewController(UIViewController(), animated: true)
    }
}

// NavigationView = SwiftUI
import SwiftUI

struct SampleView: View {    
    var body: some View {
        Text("Sample")
    }
}

struct SampleNavigationView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Push Button", destination: SampleView())   // == navigationController?.pushViewController(UIViewController(), animated: true)
            }
                .navigationTitle("Title")
                .navigationBarItems(
                    trailing: Button(
                        action: {
                            print("Did tap right bar button!")
                        },
                        label: {
                            Image(systemName: "house.fill")
                        }
                    )
                )
        }
    }
}

struct SapleNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SampleNavigationView()
    }
}
