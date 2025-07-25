//
//  mocServers.swift
//  VpnKovalenko
//
//  Created by Евгений on 25.07.2025.
//
import Foundation

struct VPNServer: Identifiable {
    let id = UUID()
    let countryFlag: String
    let location: String
    let ip: String
    let signalStrength: Int // от 1 до 4
}

let mockServers: [VPNServer] = [
    VPNServer(countryFlag: "🇹🇷", location: "Turkey, Istanbul", ip: "17.03.93.99", signalStrength: 4),
    VPNServer(countryFlag: "🇫🇷", location: "France, Paris", ip: "88.12.43.10", signalStrength: 3),
    VPNServer(countryFlag: "🇩🇪", location: "Germany, Berlin", ip: "45.90.34.1", signalStrength: 4),
    VPNServer(countryFlag: "🇺🇸", location: "USA, New York", ip: "23.45.67.89", signalStrength: 2),
    VPNServer(countryFlag: "🇬🇧", location: "UK, London", ip: "51.22.33.44", signalStrength: 3)
]
