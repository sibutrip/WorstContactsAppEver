//
//  ListTest.swift
//  AccessibilityAndLocalization
//
//  Created by Cory Tripathy on 2/9/23.
//

import SwiftUI

struct ListTest: View {
    var body: some View {
        VStack {
            Text("a")
                .swipeActions {
                    Button {
                        
                    } label: {
                        Label("ah", systemImage: "star.fill")
                    }
                    
                }
        }
    }
}

struct ListTest_Previews: PreviewProvider {
    static var previews: some View {
        ListTest()
    }
}
