


import Foundation
import NetworkExtension

final class VPNService {
    static let shared = VPNService()

    private let vpnManager = NEVPNManager.shared()
    
    //MARK: Methods
    
    func configureVPN() {
        vpnManager.loadFromPreferences { error in
            if let error = error {
                print("Ошибка загрузки настроек: \(error)")
                return
            }

            let ikev2 = NEVPNProtocolIKEv2()
            ikev2.serverAddress = "vpn.example.com"  // ТУТ СВОЙ СЕРВЕР НАДО ВОТКНУТЬ
            ikev2.remoteIdentifier = "vpn.example.com"
            ikev2.username = "test"
            ikev2.passwordReference = self.getPasswordRef()

            ikev2.authenticationMethod = .none
            ikev2.useExtendedAuthentication = true
            ikev2.disconnectOnSleep = false

            self.vpnManager.protocolConfiguration = ikev2
            self.vpnManager.isEnabled = true

            self.vpnManager.saveToPreferences { error in
                if let error = error {
                    print("Ошибка сохранения настроек: \(error)")
                } else {
                    print("VPN настроен")
                }
            }
        }
    }

    func connect() {
        do {
            try vpnManager.connection.startVPNTunnel()
            print("VPN подключается...")
        } catch {
            print("Ошибка подключения: \(error)")
        }
    }

    func disconnect() {
        vpnManager.connection.stopVPNTunnel()
        print("VPN отключён")
    }

    private func getPasswordRef() -> Data? {
        // Будем ли мы запрашивать пароль?
        return nil
    }
}
