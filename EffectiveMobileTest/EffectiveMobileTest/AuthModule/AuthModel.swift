import Foundation
import SwiftUI
import Combine

struct OtpModifer: ViewModifier {
    
    @Binding var pin : String
    
    var textLimt = 1
    
    func limitText(_ upper : Int) {
        if pin.count > upper {
            self.pin = String(pin.prefix(upper))
        }
    }
    
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .onReceive(Just(pin)) {_ in limitText(textLimt)}
            .frame(width: 45, height: 45)
            .foregroundStyle(.white)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(.tapBarIconColorGray)
            )
    }
}

enum Pins {
    case  one, two, three, four
}
