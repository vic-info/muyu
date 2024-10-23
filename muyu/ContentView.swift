//
//  ContentView.swift
//  muyu
//
//  Created by HLF_SUN on 10/23/24.
//

import SwiftUI

struct ContentView: View {
    @State var gongde: String = "功德"
    @State var showIncrement: Bool = false
    
    var body: some View {
        ZStack {
            // 设置背景颜色适应深色模式
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // 如果点击了木鱼，显示“功德+1”
                if showIncrement {
                    Text("\(gongde)+1")
                        .font(.headline)
                        .foregroundColor(.yellow)
                        .transition(.opacity)
                        .padding(.bottom, 5)
                }
                
                Image("muyu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 200, maxHeight: 200)
                    .onTapGesture {
                        // 触发震动反馈
                        let generator = UIImpactFeedbackGenerator(style:.medium)
                        generator.impactOccurred()
                        
                        withAnimation {
                            showIncrement = true
                        }
                        // 0.25秒后隐藏“功德+1”
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            withAnimation {
                                showIncrement = false
                            }
                        }
                    }
            }
        }
        .preferredColorScheme(.dark) // 设置深色模式
    }
}

#Preview {
    ContentView()
}
