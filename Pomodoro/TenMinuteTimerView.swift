//
//  TenMinuteTimerView.swift
//  Pomodoro
//
//  Created by Davide Quex on 8/13/24.
//

import SwiftUI

struct TenMinuteTimerView: View {
    
    
    @ObservedObject var viewModel = ViewModel()
    @State private var tapped = false
    
    var body: some View {
        
        
        ZStack {
            Color.offWhiteTheme.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                Text(viewModel.secondsToMinutesAndSeconds(viewModel.longBreakTimeRemaining))
                    .font(.system(size: 100))
                    .foregroundColor(.blueTheme)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 50) {
                    if viewModel.longBreakTimerMode == .running || viewModel.longBreakTimerMode == .paused {
                        Button(action: {
                            viewModel.resetTimers()
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.blueTheme)
                                .bold()
                                .font(.system(size: 20))
                        }
                    }
                    
                    Button(action: {
                        if viewModel.longBreakTimerMode == .running {
                            viewModel.pauseTimers()
                            tapped.toggle()
                        } else {
                            viewModel.startLongBreakTimer()
                            tapped.toggle()
                        }
                    }) {
                        
                        
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(Color(.blueTheme))
                            Image(systemName: viewModel.longBreakTimerMode == .running ? "pause.fill" : "play.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 34))
                        }
                    }
                    
                    if viewModel.longBreakTimerMode == .running || viewModel.longBreakTimerMode == .paused {
                        Button(action: {
                            viewModel.advanceOneMinuteForward()
                        }) {
                            Image(systemName: "goforward.10")
                                .foregroundColor(.blueTheme)
                                .fontWeight(.heavy)
                                .rotationEffect(.degrees(0))
                                .font(.system(size: 20))
                        }
                    }
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    TenMinuteTimerView()
}
