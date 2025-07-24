

import Foundation
final class MainViewModel: ObservableObject {
    
    //MARK: Properties
    
    @Published var inputTextField = ""
    @Published var textForButton: String = "Start"
    @Published var menuIsOpen: Bool = false
    
    //MARK: Methods
    func connectToServer() {
        //тут логика подключения если удачно то меняем кнопку
        self.textForButton = "Connected"
        print("коннект")
    }
}
