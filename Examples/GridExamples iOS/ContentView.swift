import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection) {
            AutoColumnsLayoutView()
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.3x2.fill")
                        Text("Auto Columns")
                    }
                }
                .tag(0)
            FixedColumnsLayoutView()
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.split.3x3.fill")
                        Text("Fixed Columns")
                    }
                }
                .tag(1)
            SingleColumnLayoutView()
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.grid.1x2.fill")
                        Text("One Column")
                    }
                }
                .tag(2)
            PerformanceLayoutView()
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.4x3.fill")
                        Text("Performance")
                    }
                }
                .tag(3)
            BuilderLayoutView()
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.3.offgrid.fill")
                        Text("Builder")
                    }
                }
                .tag(4)
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
