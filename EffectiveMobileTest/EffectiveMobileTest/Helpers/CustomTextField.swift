//
//  CustomTextField.swift
//  EffectiveMobileTest
//
//  Created by Islombek Gofurov on 18/03/24.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var result: String
    let text: String
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(.black, lineWidth: 2)
                .background(Color("RoundedRectangeBackgroundColor"))
                
            HStack {
                Image(systemName: "envelope")
                    .foregroundStyle(.gray)
                
                TextField("",
                          text: self.$result,
                          prompt: Text(text)
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 14))
                )
                    .textContentType(.emailAddress)
                    .foregroundStyle(.white)
            }
            .foregroundStyle(.gray)
            .padding(.horizontal, 16)
            
        }
        .foregroundStyle(Color("TextColor"))
        .frame(maxWidth: .infinity)
        .frame(height: 50)
    }
}
#Preview {
    CustomTextField(result: .constant(""), text: "someMessage")
}
