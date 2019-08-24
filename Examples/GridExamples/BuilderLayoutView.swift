import SwiftUI
import Grid

struct BuilderLayoutView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Section(header: Text("Section 1")) {
                    Grid(itemHeight: 20) {
                        ForEach(0...10, id: \.self) { _ in
                            Rectangle()
                                .foregroundColor(.random)
                        }
                    }
                }
                
                Section(header: Text("Section 2")) {
                    Grid(itemHeight: 20) {
                        ForEach(0...10, id: \.self) { _ in
                            Rectangle()
                                .foregroundColor(.random)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct BuilderLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        BuilderLayoutView()
    }
}
