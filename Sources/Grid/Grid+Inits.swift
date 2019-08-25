import SwiftUI

extension Grid {
    public init<Data: RandomAccessCollection>(_ data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.items = data.map({ AnyView(content($0)) })
    }
    
    public init<Data: RandomAccessCollection, ID, Item: View>(@ViewBuilder content: () -> Content) where Content == ForEach<Data, ID, Item> {
        let views = content()
        self.items = views.data.map { AnyView(views.content($0)) }
    }
}
