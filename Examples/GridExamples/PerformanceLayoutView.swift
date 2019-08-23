import SwiftUI
import Grid

struct PerformanceLayoutView: View {
    var body: some View {
        Grid(0...5000, minimumItemWidth: 20, spacing: 1) { number in
            Rectangle()
                .foregroundColor(.random)
                .frame(height: 20)
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
