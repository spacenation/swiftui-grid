import SwiftUI
import Grid

struct PerformanceLayoutView: View {
    var body: some View {
        ScrollView {
            Grid(0...5000, minItemWidth: 20, itemHeight: 20) { number in
                Rectangle()
                    .foregroundColor(.random)
            }
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
