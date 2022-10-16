//
//  ProductCellView.swift
//  Reveri
//
//  Created by Mykola Rudenko on 14.10.2022.
//

import SwiftUI
import Kingfisher

struct ProductCellView: View {
    @StateObject var viewModel: ProductCellViewModel

    var body: some View {
        VStack {
            HStack(spacing: 5) {
                KFImage(viewModel.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                Text(viewModel.title)
                    .mainDescriptionStyle()
                Spacer()
                Text(viewModel.price)
            }
            Divider()
            Text(viewModel.description)
                .mainDescriptionStyle()
        }
        .padding(10)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(16)
    }
}
