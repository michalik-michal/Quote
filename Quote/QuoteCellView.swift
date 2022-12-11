import SwiftUI

struct QuoteCellView: View {
    
    var text: String
    
    var body: some View {
        VStack {
            Text(text)
                .multilineTextAlignment(.center)
                .font(.title2)
                .foregroundColor(Color("PastelBackground"))
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color("CellBorder"))
        .cornerRadius(12)
    }
}

struct QuoteCellView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteCellView(text: "This is text quote")
    }
}
