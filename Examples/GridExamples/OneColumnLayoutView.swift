import SwiftUI
import Grid

struct OneColumnLayoutView: View {
    var body: some View {
        GeometryReader { geometry in
            Grid(0...100, minimumItemWidth: geometry.size.width) { number in
                Card(title: "\(number)")
                    .frame(height: 300)
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
