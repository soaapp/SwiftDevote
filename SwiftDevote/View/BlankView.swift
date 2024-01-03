//
//  BlankView.swift
//  SwiftDevote
//
//  Created by Jay Jahanzad on 2024-01-03.
//

import SwiftUI

struct BlankView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .background(.black)
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    BlankView()
}
