//
//  pagefour.swift
//  VpnKovalenko
//
//  Created by Евгений on 25.07.2025.
//

import Foundation
import SwiftUI

struct FourthFullscreenImageView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Image("03")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height)
                .clipped()
                .ignoresSafeArea()
                .onTapGesture {
                    dismiss()
                }
        }
        .navigationBarBackButtonHidden(true) 
    }
    
}
