import SwiftUI
import Grid

struct PerformanceLayoutView: View {
    var body: some View {
        //, minItemWidth: 20, itemHeight: 20)
        Grid(0...5000) { number in
            Rectangle()
                .foregroundColor(.random)
        }
    }
}

#if DEBUG
struct PerformanceLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        PerformanceLayoutView()
    }
}
#endif
