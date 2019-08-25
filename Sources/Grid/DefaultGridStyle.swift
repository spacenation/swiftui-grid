import SwiftUI

/// The default `Grid` style.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultGridStyle: GridStyle {
    public var padding = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    
    let minItemWidth: CGFloat = 100
    let itemHeight: CGFloat = 100
    let vSpacing: CGFloat = 8
    let hSpacing: CGFloat = 8
    
    public init() {}
    
    public func frameHeight(at index: Int, with geometry: GeometryProxy, itemsCount: Int) -> CGFloat? {
        self.itemHeight
    }
    public func frameWidth(at index: Int, with geometry: GeometryProxy, itemsCount: Int) -> CGFloat? {
        self.itemWidth(for: geometry, minItemWidth: self.minItemWidth, padding: self.padding, hSpacing: self.hSpacing)
    }
    
    public func position(at index: Int, with geometry: GeometryProxy, itemsCount: Int) -> CGPoint {
        self.position(
            at: index,
            with: geometry,
            minItemWidth: self.minItemWidth,
            itemHeight: self.itemHeight,
            padding: self.padding,
            hSpacing: self.hSpacing
        )
    }
    
    public func gridHeight(with geometry: GeometryProxy, itemsCount: Int) -> CGFloat {
        self.gridHeight(with: geometry, itemsCount: itemsCount, minItemWidth: self.minItemWidth, itemHeight: self.itemHeight, padding: self.padding, hSpacing: self.hSpacing)
    }
    
    
    @inlinable func availableWidth(with geometry: GeometryProxy, padding: EdgeInsets, hSpacing: CGFloat) -> CGFloat {
        let horizontalPadding = padding.leading + padding.trailing
        return geometry.size.width - horizontalPadding
    }
    
    @inlinable func position(at index: Int, with geometry: GeometryProxy, minItemWidth: CGFloat, itemHeight: CGFloat, padding: EdgeInsets, hSpacing: CGFloat) -> CGPoint {
        let availableWidth = self.availableWidth(with: geometry, padding: padding, hSpacing: hSpacing)
        let columnCount = Int(availableWidth / minItemWidth)
        let row = index / max(1, columnCount)
        let itemIndexAtRow = index % max(1, columnCount)
        let itemWidth = self.itemWidth(for: geometry, minItemWidth: minItemWidth, padding: padding, hSpacing: hSpacing)
        let x = ((itemWidth / 2) + CGFloat(itemIndexAtRow) * itemWidth) + padding.leading
        let y = ((itemHeight / 2) + CGFloat(row) * itemHeight) + padding.top
        return CGPoint(x: x, y: y)
    }
    
    @inlinable func itemWidth(for geometry: GeometryProxy, minItemWidth: CGFloat, padding: EdgeInsets, hSpacing: CGFloat) -> CGFloat {
        let availableWidth = self.availableWidth(with: geometry, padding: padding, hSpacing: hSpacing)
        return availableWidth / max(1.0, availableWidth / minItemWidth).rounded(.down)
    }
    
    @inlinable func gridHeight(with geometry: GeometryProxy, itemsCount: Int, minItemWidth: CGFloat, itemHeight: CGFloat, padding: EdgeInsets, hSpacing: CGFloat) -> CGFloat {
        let availableWidth = self.availableWidth(with: geometry, padding: padding, hSpacing: hSpacing)
        let columnCount = Int(availableWidth / minItemWidth)
        let rowCount = Int((CGFloat(itemsCount) / max(1.0, CGFloat(columnCount))).rounded(.up))
        let verticalPadding = padding.top + padding.bottom
        return CGFloat(rowCount) * itemHeight + verticalPadding
    }
}
