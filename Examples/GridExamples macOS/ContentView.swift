import SwiftUI
import Grid

struct ContentView: View {
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            OneColumnLayoutView()
                .tabItem {
                    Text("One Column")
                }
                .tag(0)
//            AutoColumnLayoutView()
//                .tabItem {
//                    Text("Auto Column")
//                }
//                .tag(1)
//            PerformanceLayoutView()
//                .tabItem {
//                    Text("Performance")
//                }
//                .tag(2)
//            BuilderLayoutView()
//                .tabItem {
//                    Text("Builder")
//                }
//                .tag(2)
        }
        //.frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
