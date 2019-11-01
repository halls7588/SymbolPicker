import SwiftUI


struct SymbolPicker: View {
    
    struct IDToken: Identifiable, Hashable {
        var id: String = UUID().uuidString
        var name: String
    }
    func IDTokenize() -> [IDToken] {
        sfSymbols.map {
            IDToken(name: $0)
        }
    }
    
    @State var selection: IDToken?
    @State var  isPresented: Bool = false
    
    
    
    
    var body: some View {
        Image(systemName: selection != nil ? selection!.name : "circle").resizable().popover(isPresented: $isPresented) {
            List(self.IDTokenize()) { symbol in
                HStack {
                    Image(systemName: symbol.name)
                    Spacer()
                    Text(symbol.name)
                }.onTapGesture {
                        self.selection = symbol
                    self.isPresented = false
                }
            }
        }.onTapGesture(count: 2) {
            self.isPresented = true
        }.frame(width: 200, height: 200)
        
    }
}

