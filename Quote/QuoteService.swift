import Foundation
import Firebase

struct QuoteService {
    
    func uploadQuote(quote: Quote, completion: @escaping(Bool) -> Void) {
        let data = ["quote": quote.quote]
        
        Firestore.firestore().collection("quotes").document()
            .setData(data) { error in
                if let error = error {
                    print("Failed to upload SkiDay wiht errror: \(error)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    func fetchQuotes(completion: @escaping([Quote]) -> Void) {
        Firestore.firestore().collection("quotes")
            .order(by: "date", descending: true) // hours (?)
            .addSnapshotListener { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let quotes = documents.compactMap({try? $0.data(as: Quote.self)})
                completion(quotes)
            }
    }
}
