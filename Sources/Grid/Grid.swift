import SwiftUI

/// A view that arranges its children in a grid.
@available(iOS 13.0, OSX 10.15, *)
public struct Grid<Content> : View where Content : View {
    let items: [AnyView]
    let minItemWidth: CGFloat
    let itemHeight: CGFloat
    let spacing: CGFloat
    
    @Environment(\.lastItemPosition) var lastItemPosition
    
    public var body: some View {
        GeometryReader { geometry in
//            ScrollView {
            ZStack {
                ForEach(0..<self.items.count, id: \.self) { index in
                    self.items[index]
                        .frame(
                            width: self.itemWidth(for: geometry, minItemWidth: self.minItemWidth),
                            height: self.itemHeight,
                            alignment: Alignment(horizontal: .leading, vertical: .top)
                        )
                        .position(self.position(at: index, with: geometry, minItemWidth: self.minItemWidth, itemHeight: self.itemHeight))
                }
                
            }
            .frame(height: 4000)
            
  //          }
//            ScrollView {

//                VStack(alignment: .leading, spacing: self.spacing) {
//                    ForEach(0..<self.rowCount(with: geometry), id: \.self) { rowIndex in
//                        HStack(spacing: self.spacing) {
//                            ForEach(0..<self.columnCount(with: geometry), id: \.self) { (columnIndex: Int) -> AnyView? in
//                                self.item(with: geometry, rowIndex: rowIndex, columnIndex: columnIndex)
//                            }
//                            .frame(maxWidth: .infinity)
//                        }
//                    }
//                }
//                .padding()
//            }
        }
        
        //.fixedSize(horizontal: false, vertical: false)
        //.frame(height: CGFloat(self.items.count) * self.itemHeight)

        
        //.frame(height: CGFloat(items.count) * itemHeight)
    }
    
    func position(at index: Int, with geometry: GeometryProxy, minItemWidth: CGFloat, itemHeight: CGFloat) -> CGPoint {
        let columnCount = Int(geometry.size.width / minItemWidth)
        let row: Int = index / max(1, columnCount)
        let itemIndexAtRow = index % max(1, columnCount)
        let itemWidth = self.itemWidth(for: geometry, minItemWidth: minItemWidth)
        let x = (itemWidth / 2) + CGFloat(itemIndexAtRow) * itemWidth
        let y = (itemHeight / 2) + CGFloat(row) * itemHeight
        _ = environment(\.lastItemPosition, y)
        return CGPoint(x: x, y: y)
    }
    
    @inlinable func itemWidth(for geometry: GeometryProxy, minItemWidth: CGFloat) -> CGFloat {
        geometry.size.width / max(1.0, geometry.size.width / minItemWidth).rounded(.down)
    }
    
//    private func columnCount(with geometry: GeometryProxy) -> Int {
//        Int(geometry.size.width / self.minItemWidth)
//    }
//
//    private func rowCount(with geometry: GeometryProxy) -> Int {
//        Int((CGFloat(self.items.count) / max(1.0, geometry.size.width / self.minItemWidth).rounded(.down)).rounded(.up))
//    }
    
//    func itemIndex(with geometry: GeometryProxy, rowIndex: Int, columnIndex: Int) -> Int {
//        rowIndex * max(1, Int(geometry.size.width / self.minItemWidth)) + columnIndex
//    }
    
//    func item(with geometry: GeometryProxy, rowIndex: Int, columnIndex: Int) -> AnyView {
//        if self.itemIndex(with: geometry, rowIndex: rowIndex, columnIndex: columnIndex) <= self.items.count - 1 {
//            return self.items[self.itemIndex(with: geometry, rowIndex: rowIndex, columnIndex: columnIndex)]
//        } else {
//            return AnyView(Spacer())
//        }
//    }

}

struct LastItemPositionKey: EnvironmentKey {
    static let defaultValue: Binding<CGFloat?> = .constant(nil)
}

extension EnvironmentValues {
    var lastItemPosition: Binding<CGFloat?> {
        get {
            return self[LastItemPositionKey.self]
        }
        set {
            self[LastItemPositionKey.self] = newValue
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
