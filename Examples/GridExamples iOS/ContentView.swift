import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection) {
            OneColumnLayoutView()
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.grid.1x2.fill")
                        Text("One Column")
                    }
                }
                .tag(0)
            AutoColumnLayoutView()
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.3x2.fill")
                        Text("Auto Column")
                    }
                }
                .tag(1)
            PerformanceLayoutView()
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.4x3.fill")
                        Text("Performance")
                    }
                }
                .tag(2)
            BuilderLayoutView()
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.3.offgrid.fill")
                        Text("Builder")
                    }
                }
                .tag(3)
        }
        .accentColor(.purple)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
