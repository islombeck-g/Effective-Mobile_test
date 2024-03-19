import Foundation
import SwiftUI

extension Text {
    func styleOne(isCurrent: Bool) ->some View {
        self
            .foregroundStyle(isCurrent ? Color("tapBarIconColorBlue"): Color("tapBarIconColorGray"))
            .font(.system(size: 13))
    }
    func leadMaxWidthInfin() ->some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
    }
}
