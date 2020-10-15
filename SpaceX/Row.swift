//
//  LaunchInfoView.swift
//  SpaceX
//
//  Created by Johnnie Walker on 10/8/20.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import SwiftUI

struct Row: View {
    let image: UIImage?
    let title: String
    let subtitle1: String
    let subtitle2: String
    
    var body: some View {
        HStack(spacing: 16.0) {
            Image(uiImage: image ?? UIImage())
                .resizable()
                .frame(width: 62.0, height: 62.0)
            VStack(alignment: .leading, spacing: 2.0) {
                Text(title)
                    .font(.headline)
                Group {
                    Text(subtitle1)
                    Text(subtitle2)
                }
                .font(.subheadline)
                .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 16.0)
    }
}

struct RocketInfoView_Previews: PreviewProvider {
    static let rocket = TestData.rockets[0]

    static var previews: some View {
        Row(image: rocket.logoImage,
            title: rocket.name,
            subtitle1: rocket.date?.formatted ?? "N/A",
            subtitle2: rocket.success?.formatted ?? "N/A")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
