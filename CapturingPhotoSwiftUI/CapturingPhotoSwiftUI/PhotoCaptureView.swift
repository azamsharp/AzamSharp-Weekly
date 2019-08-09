//
//  PhotoCaptureView.swift
//  CapturingPhotoSwiftUI
//
//  Created by Mohammad Azam on 8/9/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct PhotoCaptureView: View {
    
    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    
    var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image)
    }
}

#if DEBUG
struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(showImagePicker: .constant(false), image: .constant(Image("")))
    }
}
#endif
