import SwiftUI

/// A view that arranges its children in a grid.
@available(iOS 13.0, OSX 10.15, *)
public struct Grid<Data, Content> : View where Data: RandomAccessCollection, Content : View {
    private let data: [Data.Element]
    private let minimumItemWidth: CGFloat
    private let spacing: CGFloat
    private let content: (Data.Element) -> Content
    
    public var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: self.spacing) {
                    ForEach(0..<self.rowCount(with: geometry), id: \.self) { rowIndex in
                        HStack(spacing: self.spacing) {
                            ForEach(0..<self.columnCount(with: geometry), id: \.self) { (columnIndex: Int) -> Content? in
                                self.item(with: geometry, rowIndex: rowIndex, columnIndex: columnIndex)
                            }
                            .frame(maxWidth: .infinity)
                            
                            ForEach(0..<self.emptyElementsCount(geometry: geometry, row: rowIndex), id: \.self) { _ in
                                Spacer()
                            }
                        }
                    }
                }
                .padding()
            }
            
        }
    }
    
    func emptyElementsCount(geometry:GeometryProxy, row: Int) -> Int {
        let isLastRow = rowCount(with: geometry) - 1 == row
        let possibleItemsCount = rowCount(with: geometry) * columnCount(with: geometry)
        return isLastRow ? possibleItemsCount % data.count : 0
    }
    
    func rowCount(with geometry: GeometryProxy) -> Int {
        Int((CGFloat(self.data.count) / max(1.0, geometry.size.width / self.minimumItemWidth).rounded(.down)).rounded(.up))
    }
    
    func columnCount(with geometry: GeometryProxy) -> Int {
        Int(geometry.size.width / self.minimumItemWidth)
    }
    
    func itemIndex(with geometry: GeometryProxy, rowIndex: Int, columnIndex: Int) -> Int {
        rowIndex * max(1, Int(geometry.size.width / self.minimumItemWidth)) + columnIndex
    }
    
    func item(with geometry: GeometryProxy, rowIndex: Int, columnIndex: Int) -> Content? {
        if self.itemIndex(with: geometry, rowIndex: rowIndex, columnIndex: columnIndex) <= self.data.count - 1 {
            return self.content(self.data[self.itemIndex(with: geometry, rowIndex: rowIndex, columnIndex: columnIndex)])
        } else {
            return nil
        }
    }
    
    public init(_ data: Data, minimumItemWidth: CGFloat = 300, spacing: CGFloat = 8, content: @escaping (Data.Element) -> Content) {
        self.data = data.map { $0 }
        self.content = content
        self.spacing = spacing
        self.minimumItemWidth = minimumItemWidth
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
