import SwiftUI
import Grid

struct BuilderLayoutView: View {
    var body: some View {
        VStack(alignment: .center) {
            Section(header: Text("Section 1")) {
                Grid {
                    ForEach(0...10, id: \.self) { _ in
                        Rectangle()
                            .foregroundColor(.random)
                            .frame(height: 20)
                    }
                }
            }
            
            Section(header: Text("Section 2")) {
                Grid {
                    ForEach(0...10, id: \.self) { _ in
                        Rectangle()
                            .foregroundColor(.random)
                            .frame(height: 20)
                    }
                }
            }
        }
    }
}

struct BuilderLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        BuilderLayoutView()
    }
}
