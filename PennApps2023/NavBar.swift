//
//  NavBar.swift
//  PennApps2023
//
//  Created by Owen Guo on 2023-09-08.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case message
    case person
    case leaf
    case gearshape
}

struct NavBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return .blue
        case .message:
            return .green
        case .person:
            return .indigo
        case .leaf:
            return .green
        case .gearshape:
            return .orange
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage: tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? tabColor : .gray)
                        .font(.system(size:22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration:0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                        
                    
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding()
            
        }
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar(selectedTab: .constant(.house))
    }
}
 
