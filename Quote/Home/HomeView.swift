import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                Divider()
                VStack(spacing: 20) {
                    ForEach(viewModel.quotes) { quote in
                        QuoteCellView(text: quote.quote)
                    }
                }
            }
            .padding(.horizontal)
            .background(Color("PastelBackground"))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Quotes")
            .toolbar {
                NavigationLink {
                    AddQuoteView()
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(Color("CellBackground"))
                        .frame(width: 20, height: 20)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
