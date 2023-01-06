import SwiftUI

struct QuoteView: View {
    
    var quote: Quote
    @ObservedObject private var viewModel = QuoteViewModel()
    
    var body: some View {
        VStack {
            Text(quote.quote)
                .multilineTextAlignment(.center)
                .font(.title2)
                .foregroundColor(Color("Primary"))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("CellBorder"))
                .cornerRadius(12)
                .padding(.top, 20)
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        .background(Color("Primary"))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            Button {
                viewModel.deleteQuote(quote: quote) { succes in
                    if !succes {
                        print("Failed to delete quote")
                    }
                }
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: Quote(quote: "Preview quote", date: "11.12.22"))
    }
}
