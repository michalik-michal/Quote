import SwiftUI
import Firebase

@main
struct QuoteApp: App {
    
    init() {
        FirebaseApp.configure()
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
