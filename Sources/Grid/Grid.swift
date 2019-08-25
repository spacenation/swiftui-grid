import SwiftUI

/// A view that arranges its children in a grid.
@available(iOS 13.0, OSX 10.15, *)
public struct Grid<Content> : View where Content : View {
    @Environment(\.gridStyle) var style
    
    let items: [AnyView]
    
    public var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ZStack {
                    ForEach(0..<self.items.count, id: \.self) { index in
                        self.items[index]
                            .frame(
                                width: self.style.frameWidth(at: index, with: geometry, itemsCount: self.items.count),
                                height: self.style.frameHeight(at: index, with: geometry, itemsCount: self.items.count),
                                alignment: Alignment(horizontal: .leading, vertical: .top)
                            )
                            .position(self.style.position(at: index, with: geometry, itemsCount: self.items.count))
                    }
                }
                .frame(
                    width: geometry.size.width,
                    height: self.style.gridHeight(with: geometry, itemsCount: self.items.count)
                )
            }
        }
    }
}

#if DEBUG
struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid(0...100) {
            Text("\($0)")
        }
    }
}
#endif
