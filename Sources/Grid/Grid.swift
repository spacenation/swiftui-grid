import SwiftUI

/// A view that arranges its children in a grid.
@available(iOS 13.0, OSX 10.15, *)
public struct Grid<Data, Content> : View where Data: RandomAccessCollection, Data.Element: Identifiable, Content : View {
    public typealias Item = Data.Element.IdentifiedValue
    private let data: [Item]
    private let minimumItemWidth: Length
    private let spacing: Length
    private let content: (Item) -> Content
    
    public var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: self.spacing) {
                    ForEach(0..<Int((Length(self.data.count) / max(1.0, geometry.size.width / self.minimumItemWidth).rounded(.down)).rounded(.up))) { rowIndex in
                        HStack(spacing: self.spacing) {
                            ForEach(0..<Int(geometry.size.width / self.minimumItemWidth)) { columnIndex in
                                if rowIndex * max(1, Int(geometry.size.width / self.minimumItemWidth)) + columnIndex <= self.data.count - 1 {
                                    self.content(self.data[rowIndex * max(1, Int(geometry.size.width / self.minimumItemWidth)) + columnIndex])
                                } else {
                                    Rectangle().foregroundColor(.clear)
                                }
                            }
                        }
                    }
                    .clipped()
                }
                .padding()
            }
        }
        
    }
    
    public init(_ data: Data, minimumItemWidth: Length = 300, spacing: Length = 8, content: @escaping (Item) -> Content) {
        self.data = data.map { $0.identifiedValue }
        self.content = content
        self.spacing = spacing
        self.minimumItemWidth = minimumItemWidth
    }
}

#if DEBUG
struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Text("123")
    }
}
#endif
