import SwiftUI

struct AddQuoteView: View {
    
    @State private var quote = ""
    
    var body: some View {
            VStack {
                TextEditor(text: $quote)
                    .scrollContentBackground(.hidden)
                    .frame(height: 250)
                    .background(Color("CellBackground"))
                    .cornerRadius(12)
                Spacer()
                Button {
                    
                } label: {
                    Text("Add")
                        .bold()
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color("CellBackground"))
                        .cornerRadius(12)
                        .foregroundColor(Color("PastelBackground"))
                }
            }
            .padding()
            .navigationTitle("New quote")
            .background(Color("PastelBackground"))
    }
}

struct AddQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddQuoteView()
    }
}
