import SwiftUI

/// A view that arranges its children in a grid.
@available(iOS 13.0, OSX 10.15, *)
public struct Grid<Content> : View where Content : View {
    private let items: [AnyView]
    private let minimumItemWidth: CGFloat
    private let spacing: CGFloat
    
    public init<Data: RandomAccessCollection>(_ data: Data, minimumItemWidth: CGFloat = 300, spacing: CGFloat = 8, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.items = data.map({ AnyView(content($0)) })
        self.spacing = spacing
        self.minimumItemWidth = minimumItemWidth
    }
    
    public init<Data: RandomAccessCollection, ID, Item: View>(@ViewBuilder content: () -> Content) where Content == ForEach<Data, ID, Item> {
        let views = content()
        self.items = views.data.map { AnyView(views.content($0)) }
        self.minimumItemWidth = 300
        self.spacing = 8
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: self.spacing) {
                    ForEach(0..<self.rowCount(with: geometry), id: \.self) { rowIndex in
                        HStack(spacing: self.spacing) {
                            ForEach(0..<self.columnCount(with: geometry), id: \.self) { (columnIndex: Int) -> AnyView? in
                                self.item(with: geometry, rowIndex: rowIndex, columnIndex: columnIndex)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
                .padding()
            }
        }
    }
        
    func rowCount(with geometry: GeometryProxy) -> Int {
        Int((CGFloat(self.items.count) / max(1.0, geometry.size.width / self.minimumItemWidth).rounded(.down)).rounded(.up))
    }
    
    func columnCount(with geometry: GeometryProxy) -> Int {
        Int(geometry.size.width / self.minimumItemWidth)
    }
    
    func itemIndex(with geometry: GeometryProxy, rowIndex: Int, columnIndex: Int) -> Int {
        rowIndex * max(1, Int(geometry.size.width / self.minimumItemWidth)) + columnIndex
    }
    
    func item(with geometry: GeometryProxy, rowIndex: Int, columnIndex: Int) -> AnyView {
        if self.itemIndex(with: geometry, rowIndex: rowIndex, columnIndex: columnIndex) <= self.items.count - 1 {
            return self.items[self.itemIndex(with: geometry, rowIndex: rowIndex, columnIndex: columnIndex)]
        } else {
            return AnyView(Spacer())
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
