//
//  AssetSummaryView.swift
//  MyAssets
//
//  Created by 박진우 on 2022/01/18.
//

import SwiftUI

struct AssetSummaryView: View {
    // 임의로 EnvironmentObject 설정 가능
    @EnvironmentObject var assetData: AssetSummaryData
    
    var assets: [Asset] {
        assetData.assets
    }
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(assets) { asset in
                switch asset.type {
                case .creditCard:
                    AssetCardSectionView(asset: asset)
                        .frame(idealHeight: 250)
                default:
                    AssetSectionView(assectSection: asset)
                }
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
        }
    }
}

struct AssetSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        AssetSummaryView()
            .environmentObject(AssetSummaryData())  // AssetSummaryData에서 받아온(Published) 데이터를 기반으로 preview를 보여줌
            .background(Color.gray.opacity(0.2))
    }
}
