import SwiftUI
import Grid

struct AutoColumnLayoutView: View {
    var body: some View {
        Grid(0...100) { number in
            Card(title: "\(number)")
        }
        .padding()
        .gridStyle(FixedColumnsGridStyle(columns: 5, itemHeight: 100))
    }
}

#if DEBUG
struct AutoColumnsGridView_Previews: PreviewProvider {
    static var previews: some View {
        AutoColumnLayoutView()
    }
}
#endif
