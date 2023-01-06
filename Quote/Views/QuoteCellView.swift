import SwiftUI

struct QuoteCellView: View {
    
    var quote: Quote
    
    var body: some View {
        NavigationLink {
            QuoteView(quote: quote)
        } label: {
            Text(quote.quote)
                .multilineTextAlignment(.center)
                .font(.title2)
                .foregroundColor(Color("Primary"))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("CellBorder"))
                .cornerRadius(12)
        }
    }
}

struct QuoteCellView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteCellView(quote: Quote(quote: "Preview quote", date: "11.12.22"))
    }
}
