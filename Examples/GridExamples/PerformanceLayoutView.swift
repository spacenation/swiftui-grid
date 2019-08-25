import SwiftUI
import Grid

struct PerformanceLayoutView: View {
    var body: some View {
        Grid(0...5000) { number in
            Rectangle()
                .foregroundColor(.random)
        }
        .gridStyle(
            AutoColumnsGridStyle(minItemWidth: 16, itemHeight: 16, spacing: 0)
        )
    }
}

#if DEBUG
struct PerformanceLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        PerformanceLayoutView()
    }
}
#endif
