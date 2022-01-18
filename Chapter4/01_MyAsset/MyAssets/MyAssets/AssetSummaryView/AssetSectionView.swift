//
//  AssetSectionView.swift
//  MyAssets
//
//  Created by 박진우 on 2022/01/18.
//

import SwiftUI

struct AssetSectionView: View {
    // ObservedObject: ObservableObject와 연결된 observe하는 object
    @ObservedObject var assectSection: Asset
    
    var body: some View {
        VStack(spacing: 20) {
            AssetSectionHeaderView(title: assectSection.type.title)
            ForEach(assectSection.data) { asset in
                HStack {
                    Text(asset.title)
                        .font(.title)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(asset.amount)
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                Divider()
            }
        }
        .padding()
    }
}

struct AssetSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let asset = Asset(
            id: 0,
            type: .bankAccount,
            data: [
                AssetData(id: 0, title: "신한은행", amount: "5,300,00원"),
                AssetData(id: 1, title: "국민은행", amount: "15,300,00원"),
                AssetData(id: 2, title: "카카오뱅크", amount: "25,300,00원")
            ])
        AssetSectionView(assectSection: asset)
    }
}
