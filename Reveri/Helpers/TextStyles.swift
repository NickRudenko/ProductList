//
//  TextStyles.swift
//  Reveri
//
//  Created by Mykola Rudenko on 14.10.2022.
//

import SwiftUI

extension Text {
    func mainTitleStyle() -> some View {
        self.foregroundColor(.primary)
            .font(.largeTitle)
    }
    
    func mainDescriptionStyle() -> some View {
        self.foregroundColor(Color.primary)
            .font(.system(size: 12))
    }
}
