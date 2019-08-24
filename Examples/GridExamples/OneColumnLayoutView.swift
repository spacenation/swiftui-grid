import SwiftUI
import Grid

struct OneColumnLayoutView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                Grid(0...100, minItemWidth: geometry.size.width, itemHeight: 300) { number in
                    Card(title: "\(number)")
                }
                .padding()
            }
        }

    }
}

#if DEBUG
struct OneColumnLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        OneColumnLayoutView()
    }
}
#endif
