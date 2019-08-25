import SwiftUI
import Grid

struct AutoColumnsLayoutView: View {
    var body: some View {
        Grid(0...100) { number in
            Card(title: "\(number)")
        }
        .padding()
    }
}

#if DEBUG
struct AutoColumnsGridView_Previews: PreviewProvider {
    static var previews: some View {
        AutoColumnsLayoutView()
    }
}
#endif
