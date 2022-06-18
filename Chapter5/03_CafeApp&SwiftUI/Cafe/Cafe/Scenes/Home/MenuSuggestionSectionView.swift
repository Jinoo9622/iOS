//
//  MenuSuggestionSectionView.swift
//  Cafe
//
//  Created by 박진우 on 2022/05/14.
//

import SwiftUI

struct MenuSuggestionSectionView: View {
    @Binding var coffeeMenu: [CoffeeMenu]
    
    var body: some View {
        VStack {
            Text("\(User.shared.userName)님을 위한 추천메뉴")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16.0)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(coffeeMenu) { menu in
                        MenuSuggestionItemView(coffeeMenu: menu)
                    }
                }
                .padding(.horizontal, 16.0)
            }
        }
    }
}

struct MenuSuggestionItemView: View {
    let coffeeMenu: CoffeeMenu
    var body: some View {
        VStack {
            coffeeMenu.image
                .resizable()
                .clipShape(Circle())    // = .cornerRadius(radius: CGFloat)
                .frame(width: 100.0, height: 100.0)
            Text(coffeeMenu.name)
                .font(.caption)
        }
    }
}
//
//struct MenuSuggestionSectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        // preview spacing 문제가 있어보이나, HomeView에서 확인하면 정상적으로 노출
//        // -> swiftui로 작업 시, superview를 확인해가면서 작업하는것이 좋
//        MenuSuggestionSectionView()
//    }
//}
