import SwiftUI

struct CustomSearchBar: View {
    
    @Binding var text: String
    @State private var isEditing:Bool = false
    
    var body: some View {
        HStack {
            TextField("Должность, ключевые слова", text: $text)
                .padding(15)
                .padding(.horizontal, 25)
                .background(Color("Gray"))
                .foregroundStyle(Color.lightGray)
                .clipShape(.rect(cornerRadius: 15))
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color.lightGray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                        
                        if self.isEditing || !self.text.isEmpty {
                            withAnimation {
                                Button {
                                    self.text = ""
                                    self.isEditing = false
                                } label: {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundStyle(Color.lightGray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    })
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color("SecondaryColor"), lineWidth: 2)
                )
                .onTapGesture {
                    self.isEditing = true
                }
        }
    }
}

#Preview {
    CustomSearchBar(text: .constant("dsf"))
}

