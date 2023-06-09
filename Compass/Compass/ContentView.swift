import SwiftUI

struct ContentView: View {
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some View {
        ZStack {
            
            switch viewRouter.currentScreen {
                
            case Screen.homeScreen:
                HomeView()
                
            case Screen.circleScreen:
                CircleGraphView()
            }
        }
        .environmentObject(viewRouter)
        .onAppear {
            let screenState = UserDefaults.standard.string(forKey: "screenState") ?? "homeScreen"
            
            switch screenState {
            case "homeScreen":
                viewRouter.currentScreen = .homeScreen
            case "new":
                viewRouter.currentScreen = .circleScreen
            default:
                viewRouter.currentScreen = .homeScreen
            }
        }
    }
}
