
import SwiftUI

struct SettingsView: View {
    @Binding var isPresented: Bool
    @State private var progress: CGFloat = 70
    private let total: CGFloat = 365

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, Color(red: 0.05, green: 0.1, blue: 0.1)]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // Кастомная кнопка Назад
                HStack {
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding()
                    }
                    Spacer()
                }

                VStack(spacing: 8) {
                    Image(systemName: "shield.lefthalf.filled")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.teal)
                        .overlay(
                            Text("IV")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        )
                    Text("Id: 713745")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                .padding(.top, 10)

                Text("Just days: 1273")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.top, 20)

                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.4))
                        .frame(height: 20)

                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.orange)
                        .frame(width: (progress / total) * UIScreen.main.bounds.width * 0.7, height: 20)

                    HStack {
                        Spacer()
                        Text("🎁")
                            .padding(.trailing, 8)
                    }
                }
                .padding(.horizontal, 40)

                Text("\(Int(progress))/\(Int(total))")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                    .overlay(
                        Text("/\(Int(total))")
                            .foregroundColor(.teal),
                        alignment: .trailing
                    )

                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.teal.opacity(0.2))
                    .frame(height: 50)
                    .padding(.horizontal, 40)
                    .overlay(
                        Text("TAKE")
                            .foregroundColor(.white.opacity(0.4))
                            .fontWeight(.bold)
                    )
                    .disabled(true)

                Spacer()

                Button(action: {
                    // Поддержка
                }) {
                    Text("SUPPORT")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.teal.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }

                Spacer().frame(height: 20)
            }
        }
        .navigationBarBackButtonHidden(true) // скрываем системную кнопку назад
    }
}
