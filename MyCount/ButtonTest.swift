//
//  ButtonTest.swift
//  MyCount
//
//  Created by Victor Morel on 16/03/2021.
//

import SwiftUI

struct ButtonTest: View {
    var body: some View {
        Button(action: {print("Clicked")}, label: {
            Text("10")
                .foregroundColor(.primary)
                .padding()
                .background(Color.green)
                .cornerRadius(8)
                
        })
    }
}

struct ButtonTest_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTest()
    }
}
