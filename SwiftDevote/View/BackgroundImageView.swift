//
//  BackgroundImageView.swift
//  SwiftDevote
//
//  Created by Jay Jahanzad on 2023-12-29.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

#Preview {
    BackgroundImageView()
}
