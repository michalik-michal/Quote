import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                Divider()
                VStack(spacing: 20) {
                    ForEach(viewModel.quotes) { quote in
                        QuoteCellView(quote: quote)
                    }
                }
            }
            .padding(.horizontal)
            .background(Color("Primary"))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Quotes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AddQuoteView()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(Color("SecondaryBackground"))
                            .frame(width: 20, height: 20)
                    }
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
