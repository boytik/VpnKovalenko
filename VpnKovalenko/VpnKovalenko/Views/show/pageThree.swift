//
//  pageThree.swift
//  VpnKovalenko
//
//  Created by Евгений on 25.07.2025.
//


import SwiftUI

struct ThirdFullscreenImageView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Image("02")
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
    }
}

