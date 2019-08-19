import SwiftUI
import Grid

struct AutoColumnLayoutView: View {
    var body: some View {
        Grid(0...100, minimumItemWidth: 120) { number in
            Card(title: "\(number)")
                .frame(height: 100)
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
