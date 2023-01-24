//
//  infoPanelView.swift
//  Pinch
//
//  Created by Maikon Ferreira on 23/01/23.
//

import SwiftUI

struct infoPanelView: View {
    
    //MARK: - PROPERTIES
    var scale: CGFloat
    var offset: CGSize
    //properties that define default value to modifiers
    @State private var isInfoPanelVisible: Bool = false
    
    //MARK: - CONTENT
    
    var body: some View {
        HStack {
            //MARK: - HOTSPOT
            Image(systemName: "circle.circle")
            //hotspot modifiers
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
            //MARK: - LONG PRESS GESTURE
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.easeOut) {
                        isInfoPanelVisible.toggle()
                    }
                }
            
            Spacer()
            
            //MARK: -INFO PANEL
            HStack(spacing: 2) {
                Spacer()
                
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                
                Spacer()
            }//END OF HSTACK INFO
            //panel data modifiers
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVisible ? 1 : 0)
            
            Spacer()
        }//END OF HSTACK PANEL
    }
}

struct infoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        infoPanelView(scale: 1, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
