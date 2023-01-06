import SwiftUI

struct AddQuoteView: View {
    
    private let service = QuoteService()
    @Environment(\.presentationMode) var presentationMode
    @State private var quote = ""
    
    var body: some View {
            VStack {
                TextEditor(text: $quote)
                    .scrollContentBackground(.hidden)
                    .frame(height: 250)
                    .background(Color("SecondaryBackground"))
                    .cornerRadius(12)
                Spacer()
                Button {
                    if quote != "" {
                        service.uploadQuote(quote: Quote(quote: quote, date: Date().description)) { succes in
                            if succes {
                                presentationMode.wrappedValue.dismiss()
                            } else {
                                return
                            }
                        }
                    }
                } label: {
                    Text("Add")
                        .bold()
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color("SecondaryBackground"))
                        .cornerRadius(12)
                        .foregroundColor(Color("Primary"))
                }
            }
            .padding()
            .navigationTitle("New quote")
            .background(Color("Primary"))
    }
}

struct AddQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddQuoteView()
    }
}
