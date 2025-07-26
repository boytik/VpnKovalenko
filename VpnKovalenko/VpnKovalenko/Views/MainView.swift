
import SwiftUI

struct MainView: View {
    @State private var isConnected = false
    @State private var showKeyPopup = false
    @State private var accessKey = ""

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.black, Color(red: 0.05, green: 0.1, blue: 0.1)]),
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                if isConnected {
                    ConnectedContent(
                        isConnected: $isConnected,
                        speed: 33,
                        sessionTime: "02:23:05"
                    )
                } else {
                    DisconnectedContent(
                        onConnect: { isConnected = true },
                        onAccessKey: { showKeyPopup = true }
                    )
                }

                // Модальное окно для Access Key
                if showKeyPopup {
                    Color.black.opacity(0.6)
                        .ignoresSafeArea()

                    VStack(spacing: 20) {
                        Text("Enter Access Key")
                            .font(.headline)
                            .foregroundColor(.white)

                        TextField("16-digit key", text: $accessKey)
                            .keyboardType(.asciiCapable)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.teal.opacity(0.5), lineWidth: 1))
                            .onChange(of: accessKey) { newValue in
                                if newValue.count > 16 {
                                    accessKey = String(newValue.prefix(16))
                                }
                            }

                        HStack(spacing: 20) {
                            Button("Cancel") {
                                showKeyPopup = false
                                accessKey = ""
                            }
                            .foregroundColor(.red)

                            Button("OK") {
                                showKeyPopup = false
                                print("Entered key: \(accessKey)")
                            }
                            .foregroundColor(.teal)
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.9))
                    .cornerRadius(16)
                    .padding(.horizontal, 40)
                    .shadow(color: .black.opacity(0.8), radius: 10, x: 0, y: 4)
                }
            }
        }
        .animation(.easeInOut, value: isConnected)
    }
}

#Preview {
    MainView()
}
