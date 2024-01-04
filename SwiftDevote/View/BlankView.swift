//
//  BlankView.swift
//  SwiftDevote
//
//  Created by Jay Jahanzad on 2024-01-03.
//

import SwiftUI

struct BlankView: View {
    
    var backgroundColor: Color
    var backgroundOpacity: Double
    
    var body: some View {
        VStack {
            Spacer()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .background(backgroundColor)
                .opacity(backgroundOpacity)
                .blendMode(.overlay)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    BlankView(backgroundColor: .black, backgroundOpacity: 0.3)
}
