

import SwiftUI


struct SecondFullscreenImageView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showThirdScreen = false
    @State private var showFourthScreen = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("04")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height)
                    .clipped()
                    .ignoresSafeArea()

                // 🔧 Кликабельная зона над шестерёнкой (верхний левый угол)
                Color.clear
                    .contentShape(Rectangle())
                    .frame(width: 60, height: 60)
                    .position(x: 50, y: 50)
                    .onTapGesture {
                        showFourthScreen = true
                    }

                // ⛽️ Кликабельная зона над Kill Switch (чуть увеличенная)
                Color.clear
                    .contentShape(Rectangle())
                    .frame(width: 140, height: 100)
                    .position(x: geometry.size.width - 95, y: geometry.size.height - 180)
                    .onTapGesture {
                        dismiss()
                    }

                // 🌐 Кликабельная зона над блоком с сервером
                Color.clear
                    .contentShape(Rectangle())
                    .frame(width: max(geometry.size.width - 40, 0), height: 70)
                    .position(x: geometry.size.width / 2, y: geometry.size.height - 80)
                    .onTapGesture {
                        showThirdScreen = true
                    }
            }
            .fullScreenCover(isPresented: $showThirdScreen) {
                ThirdFullscreenImageView()
            }
            .fullScreenCover(isPresented: $showFourthScreen) {
                FourthFullscreenImageView()
            }
        }
        .navigationBarBackButtonHidden(true) 
    }
}




