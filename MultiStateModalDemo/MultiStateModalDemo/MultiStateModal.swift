//
//  MultiStateModal.swift
//  MultiStateModalDemo
//
//  Created by Mohammad Azam on 5/23/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

enum DisplayMode {
    case full
    case half
    case none
}

struct MultiStateModal<Content>: View where Content: View {
    
    @Binding var mode: DisplayMode
    var content: () -> Content
    
    var offsetY: CGFloat {
        
        switch mode {
            case .full:
                return 0.0
            case .half:
                return 200
            case .none:
                return UIScreen.main.bounds.size.height
        }
        
        
    }
    
    var body: some View {
        ZStack {
            content()
            .cornerRadius(20)
            .offset(y: self.offsetY)
            .shadow(color: Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), radius: 6, x: 10, y: 8)
            .shadow(color: Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), radius: 6, x: -10, y: -8)
            .animation(.spring())
        }
    }
}

struct MultiStateModal_Previews: PreviewProvider {
    static var previews: some View {
        MultiStateModal<Card>(mode: .constant(.full), content: { Card() })
    }
}
