

import SwiftUI

struct FullscreenImageView: View {
    @State private var navigateToSecond = false
    @State private var navigateToFourth = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("01")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                // Центр: кнопка Connect
                Color.clear
                    .contentShape(Rectangle())
                    .frame(width: 200, height: 200)
                    .position(x: UIScreen.main.bounds.width / 2,
                              y: UIScreen.main.bounds.height / 2 - 40)
                    .onTapGesture {
                        navigateToSecond = true
                    }

                // Шестерёнка
                Color.clear
                    .contentShape(Rectangle())
                    .frame(width: 60, height: 60)
                    .position(x: 50, y: 50)
                    .onTapGesture {
                        navigateToFourth = true
                    }
            }
            .navigationDestination(isPresented: $navigateToSecond) {
                SecondFullscreenImageView()
            }
            .navigationDestination(isPresented: $navigateToFourth) {
                FourthFullscreenImageView()
            }
        }
    }
}



#Preview {
    FullscreenImageView()
}
