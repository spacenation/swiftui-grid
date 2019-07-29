import Grid
import SwiftUI

struct ContentView: View {
    var body: some View {
        Grid(0...12, minimumItemWidth: 280, spacing: 16) {
            CardView(number: $0)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
