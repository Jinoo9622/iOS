//
//  ContentDetailView.swift
//  NetflixStyleSampleApp
//
//  Created by 박진우 on 2022/01/10.
//

import SwiftUI

struct ContentDetailView: View {
    @State var item: Item?
    
    var body: some View {
        // Stack View의 경우 자식 View를 한번에 load
        // -> layout을 빠르고 안정적이게 보여줄 수 있(시스템이 미리 계산)
        // Lazy Stack View의 경우, 하위 View가 표시(보여질) 때만 정확한 위치 및 사이즈 계산
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ZStack(alignment: .bottom) {
                if let item = item {
                    Image(uiImage: item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                    
                    Text(item.description)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundColor(.primary)
                        .background(Color.primary.colorInvert().opacity(0.75))
                } else {
                    Color.white
                }
            }
        }
        
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let item0 = Item(description: "흥미진진, 판타지, 애니메이션, 액션, 멀티캐스팅", imageName: "poster0")
        ContentDetailView(item: item0)
    }
}
