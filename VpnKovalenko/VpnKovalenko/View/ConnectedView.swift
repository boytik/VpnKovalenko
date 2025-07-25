import SwiftUI



import SwiftUI

struct ConnectedContent: View {
    @Binding var isConnected: Bool
    var onSettingsTap: () -> Void
    var speed: Int = 40
    var sessionTime: String

    @State private var showServerList = false

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button(action: {
                    onSettingsTap()
                }) {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 22))
                        .padding()
                }
                Spacer()
            }

            Text("VPN KOVALENKO")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)

            SpeedometerView(speed: speed)

            Text("\(speed)")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.white)
                .shadow(radius: 10)

            Text("Mbit/s")
                .foregroundColor(.white)

            HStack {
                VStack(alignment: .leading) {
                    Text("Time:")
                        .foregroundColor(.white)
                    Text(sessionTime)
                        .foregroundColor(.white)
                        .font(.title3)
                }

                Spacer()

                Button(action: {
                    withAnimation {
                        isConnected = false
                    }
                }) {
                    VStack {
                        Text("Kill Switch")
                            .foregroundColor(.white)
                        Image(systemName: "fuelpump.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.orange)
                    }
                }
            }
            .padding(.horizontal, 40)
            .padding(.top, 10)

            Spacer()

            Button {
                showServerList = true
            } label: {
                HStack {
                    Text("🇹🇷")
                    VStack(alignment: .leading) {
                        Text("Turkey, Istanbul")
                            .foregroundColor(.white)
                        Text("ip: 17.03.93.99")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.black.opacity(0.4))
                .cornerRadius(12)
                .padding(.horizontal, 40)
            }

            Spacer().frame(height: 30)
        }
        .sheet(isPresented: $showServerList) {
            ServerListView(servers: mockServers)
        }
    }
}

