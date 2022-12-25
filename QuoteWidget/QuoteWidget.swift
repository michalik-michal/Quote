import WidgetKit
import SwiftUI
import Firebase

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
        
        let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: date)!
        
        fetchData { quote in
            let entry = SimpleEntry(date: date, quoteData: quote)
            let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
            completion(timeline)
        }
    }
    
    func fetchData(completion: @escaping (QuoteModel) -> ()) {
        let db = Firestore.firestore().collection("quotes").document("1QTKmjLB1yTlMbzgOQQ3")
        
        db.getDocument { snapshot, error in
            guard let doc = snapshot?.data() else {
                completion(QuoteModel(quote: "Error"))
                return
            }
            let quote = doc["quote"] as? String ?? ""
            completion(QuoteModel(quote: quote))
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
            if let quote = entry.quoteData?.quote {
                Text(quote)
            } else {
                Text("Error")
            }
        }
    }
}

struct QuoteModel: Identifiable {
    var id = UUID().uuidString
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
