
import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            Button("меню"){
                viewModel.menuIsOpen.toggle()
            }
            Button("\(viewModel.textForButton)") {
                viewModel.connectToServer()
            }
            Button("Поддержка") {
                //Открыть веб вью с чатом поддержки?
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
}
