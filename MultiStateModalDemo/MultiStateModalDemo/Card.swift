//
//  Card.swift
//  HelloHalfModal
//
//  Created by Mohammad Azam on 5/22/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct Card: View {
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.red)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
    }
}
