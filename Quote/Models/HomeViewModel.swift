import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var quotes = [Quote]()
    
    let service = QuoteService()
    
    init() {
        self.fetchQuotes()
    }
    
    func fetchQuotes() {
        service.fetchQuotes { quotes in
            self.quotes = quotes
        }
    }
}
