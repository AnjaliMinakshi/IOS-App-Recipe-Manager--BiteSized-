//
//  CustomTextField.swift
//  Recipe Manager
//
//  Created by Anjali Minakshi on 01/07/26.
//

import SwiftUI

struct CustomTextField: View {

    let title: String

    @Binding var text: String

    var body: some View {

        VStack(alignment: .leading, spacing: 6) {

            Text(title)
                .font(.headline)

            TextField("Enter \(title)", text: $text)
                .padding()
                .background(Color(.systemGray))
                .cornerRadius(10)

        }
        .padding(.vertical, 5)
    }
}

#Preview {

    CustomTextField(
        title: "Recipe Name",
        text: .constant("")
    )

}
