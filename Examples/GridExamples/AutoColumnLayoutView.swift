import SwiftUI
import Grid

struct AutoColumnLayoutView: View {
    var body: some View {
        ScrollView {
            Grid(0...100, minItemWidth: 120, itemHeight: 100) { number in
                Card(title: "\(number)")
            }
            .padding()
        }
    }
}

#if DEBUG
struct AutoColumnsGridView_Previews: PreviewProvider {
    static var previews: some View {
        AutoColumnLayoutView()
    }
}
#endif
