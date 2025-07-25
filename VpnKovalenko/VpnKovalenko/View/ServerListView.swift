//
//  ServerListView.swift
//  VpnKovalenko
//
//  Created by Евгений on 25.07.2025.
//

import SwiftUI

struct ServerListView: View {
    let servers: [VPNServer]
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            List(servers) { server in
                HStack {
                    Text(server.countryFlag)
                    VStack(alignment: .leading) {
                        Text(server.location)
                            .foregroundColor(.white)
                        Text("ip: \(server.ip)")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    Spacer()
                    Image(systemName: "wifi")
                        .foregroundColor(.white)
                        .overlay(
                            GeometryReader { geometry in
                                HStack(spacing: 2) {
                                    ForEach(1...4, id: \.self) { i in
                                        Circle()
                                            .fill(i <= server.signalStrength ? Color.white : Color.gray)
                                            .frame(width: 4, height: 4)
                                    }
                                }
                                .frame(width: geometry.size.width, height: geometry.size.height)
                            }
                        )
                }
                .padding(.vertical, 6)
                .listRowBackground(Color.black.opacity(0.6))
            }
            .background(Color.black)
            .scrollContentBackground(.hidden)
            .navigationTitle("Choose a VPN server")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}
