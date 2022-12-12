import FirebaseFirestoreSwift
import Firebase

struct Quote: Identifiable, Decodable, Equatable {
   
    @DocumentID var id: String?
    var quote: String
    var date: String
}
