import Foundation

class QuoteViewModel: ObservableObject {
    
    private let service = QuoteService()
    
    func deleteQuote(quote: Quote, completion: @escaping(Bool) -> Void) {
        service.deleteQuote(quote) { succes in
            if succes {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
}
