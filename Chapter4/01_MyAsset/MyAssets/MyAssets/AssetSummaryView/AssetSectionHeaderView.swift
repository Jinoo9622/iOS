//
//  AssetSectionHeaderView.swift
//  MyAssets
//
//  Created by 박진우 on 2022/01/18.
//

import SwiftUI

struct AssetSectionHeaderView: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.blue)
            
            Divider()
                .frame(height: 2)
                .background(Color.primary)
                .foregroundColor(.accentColor)
        }
    }
}

struct AssetSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AssetSectionHeaderView(title: "은행")
    }
}
