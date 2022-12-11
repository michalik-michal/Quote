import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                Divider()
                VStack(spacing: 20) {
                    ForEach((1...10), id: \.self) { _ in
                        QuoteCellView(text: "Teswdedefjvpsprrprpspirjrpi spjrpsfprifpa p jfspij fpirjsp pt")
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
