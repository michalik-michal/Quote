import WidgetKit
import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let date = Date()
        
        let nextUpdate = Calendar.current.date(byAdding: .hour, value: 6, to: date)!
        
        fetchData { quote in
            let entry = SimpleEntry(date: date, quoteData: quote)
            let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
            completion(timeline)
        }
    }
    
    func fetchData(completion: @escaping (QuoteModel) -> ()) {
        Firestore.firestore().collection("quotes")
            .addSnapshotListener { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let quotes = documents.compactMap({try? $0.data(as: QuoteModel.self)})
                if let randomQuote = quotes.randomElement() {
                    completion(randomQuote)
                } else {
                    completion(QuoteModel(quote: "\(documents)"))
                }
            }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    var quoteData: QuoteModel?
}

struct QuoteWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Color("CellBorder")
            if let quote = entry.quoteData?.quote {
                Text("＂\(quote)＂")
                    .font(.system(.title))
                    .foregroundColor(Color("PastelBackground"))
                    .multilineTextAlignment(.center)
            } else {
                Text("Error")
            }
        }
    }
}

struct QuoteModel: Identifiable, Decodable, Equatable {
    @DocumentID var id: String?
    var quote: String
}

struct QuoteWidget: Widget {
    
    init() {
        FirebaseApp.configure()
    }
    let kind: String = "QuoteWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            QuoteWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Quote")
        .description("This is an example widget.")
    }
}

struct QuoteWidget_Previews: PreviewProvider {
    static var previews: some View {
        QuoteWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
