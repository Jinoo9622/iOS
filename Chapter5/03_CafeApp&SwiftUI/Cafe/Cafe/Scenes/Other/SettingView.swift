//
//  SettingView.swift
//  Cafe
//
//  Created by 박진우 on 2022/06/06.
//

import SwiftUI

struct SettingView: View {
    // OtherView에서 background color를 setting -> 별도로 설정할 필요 X
    var body: some View {
        List {
            Section {
                SettingUserInfoSectionView()
            }
            
            Section {
                Button("회원 정보 수정") {}
                    .tint(.black)
                Button("회원 탈퇴") {}
                    .tint(.black)
            }
        }
            .navigationTitle("설정")
            .listStyle(GroupedListStyle())
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingUserInfoSectionView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4.0) {
                Text(User.shared.userName)
                    .font(.title)
                Text(User.shared.account)
                    .font(.caption)
            }
            Spacer()
            Button(action: {}) {
                Text("로그아웃")
                    .tint(.green)
                    .font(.system(size: 14.0, weight: .bold, design: .default))
            }
                .padding(8.0)
                .overlay(Capsule().stroke(Color.green))
        }
    }
}

struct SettingView_PreViews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
