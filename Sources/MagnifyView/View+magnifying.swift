// Copyright © 4.7.2022 Tommi Kivimäki.

import SwiftUI

@available(iOS 15, *)
extension View {
    public func magnifying(size: CGSize,
                           minZoom: CGFloat,
                           maxZoom: CGFloat,
                           showIndicators: Bool) -> some View {
        modifier(Magnifying(size: size,
                            minZoom: minZoom,
                            maxZoom: maxZoom,
                            showIndicators: showIndicators))
    }
}
