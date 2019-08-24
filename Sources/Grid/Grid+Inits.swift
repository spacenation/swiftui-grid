import SwiftUI

extension Grid {
    public init<Data: RandomAccessCollection>(_ data: Data, minItemWidth: CGFloat = 100, itemHeight: CGFloat = 100, spacing: CGFloat = 8, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.init(items: data.map({ AnyView(content($0)) }), minItemWidth: minItemWidth, itemHeight: itemHeight, spacing: spacing)
    }
    
    public init<Data: RandomAccessCollection, ID, Item: View>(minItemWidth: CGFloat = 100, itemHeight: CGFloat = 100, spacing: CGFloat = 8, @ViewBuilder content: () -> Content) where Content == ForEach<Data, ID, Item> {
        let views = content()
        self.init(items: views.data.map { AnyView(views.content($0)) }, minItemWidth: minItemWidth, itemHeight: itemHeight, spacing: spacing)
    }
}
