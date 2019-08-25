import SwiftUI
import Grid

struct FixedColumnsLayoutView: View {
    var body: some View {
        Grid(0...100) { number in
            Card(title: "\(number)")
        }
        .padding()
        .gridStyle(FixedColumnsGridStyle(columns: 5, itemHeight: 100))
    }
}

struct FixedColumnsLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        FixedColumnsLayoutView()
    }
}
