
import SwiftUI

struct DisconnectedContent: View {
    var onConnect: () -> Void
    var onAccessKey: () -> Void

    var body: some View {
        VStack(spacing: 30) {
            Text("VPN KOVALENKO")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text("1 Day")
                .foregroundColor(.white)
                .font(.subheadline)

            Button(action: onConnect) {
                ZStack {
                    Circle()
                        .strokeBorder(Color.teal.opacity(0.5), lineWidth: 3)
                        .frame(width: 200, height: 200)

                    Text("Connect")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                }
            }
            .padding(.top, 20)

            VStack(spacing: 8) {
                Text("Current location:")
                    .foregroundColor(.white)

                HStack(spacing: 8) {
                    Text("🇷🇺")
                    Text("Moscow, Russia")
                        .foregroundColor(.white)
                }

                Text("ip: 12.34.01.1110")
                    .foregroundColor(.white)
                    .font(.caption)
            }

            Spacer()

            Button(action: onAccessKey) {
                Text("ACCESS KEY")
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
}


