//
//  BackView.swift
//  MarvelCard
//
//  Created by Ayush Kumar Singh on 10/14/24.
//

import SwiftUI

struct BackView: View {
    let cardWidth: CGFloat = 260
    var cardHeight: CGFloat { cardWidth * (10.0 / 7.0) }
    let cardBackground = Color(red: 245/255, green: 236/255, blue: 200/255)
    let cardForeground = Color(red: 240/255, green: 206/255, blue: 100/255)
    let cardAccent = Color(red: 224/255, green: 118/255, blue: 36/255)
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(cardBackground)
                .frame(width: cardWidth, height: cardHeight) // 1:1.4 ratio
                .shadow(radius: 8)
            Rectangle()
                .foregroundStyle(cardForeground)
                .frame(width: cardWidth * 0.92, height: cardHeight * 0.90) // 1:1.4 ratio
                .padding(.bottom, 12)
            VStack(spacing: 6) {
                // Top Band
                ZStack {
                    Rectangle()
                        .foregroundStyle(cardAccent)
                        .frame(width: cardWidth * 0.92, height: 28)
                    HStack {
                        Text("CAPTAIN AMERICA ")
                            .foregroundStyle(cardBackground)
                            .fontWeight(.bold)
                            .padding(.leading)
                        
                        Image("MarvelComicsIconBack")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 54, height: 32)
                            .padding(.trailing)
                    }
                }
                
                .padding()
                
                // Personal Data Section
                HStack(alignment: .top, spacing: 20) {
                    // Photo
                    
                    ZStack {
                        Rectangle()
                            .foregroundStyle(cardAccent)
                            .frame(width: 56, height: 72)
                        
                        Rectangle()
                            .foregroundStyle(cardBackground)
                            .frame(width: 56 * 0.90, height: 72 * 0.90)
                        
                        Image("CaptainAmericaFace")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 56 * 0.85, height: 72 * 0.85)
                    }
                    VStack(alignment: .leading, spacing: 2) {
                        // Personal Information
                        Group {
                            HStack(alignment: .firstTextBaseline, spacing: 2) {
                                Text("Real Name:").bold()
                                Text("Steve Rogers")
                            }
                            HStack(alignment: .firstTextBaseline, spacing: 2) {
                                Text("Group Affiliation:").bold()
                                Text("Avengers")
                            }
                            HStack(alignment: .firstTextBaseline, spacing: 2) {
                                Text("Height:").bold()
                                Text("6'2\"")
                                Text("  Weight:").bold()
                                Text("240 lbs.")
                            }
                            HStack(alignment: .firstTextBaseline, spacing: 2) {
                                Text("Battles Fought:").bold()
                                Text("2433")
                            }
                            HStack(alignment: .firstTextBaseline, spacing: 2) {
                                Text("Wins:").bold()
                                Text("1889")
                                
                                Text("  Ties:").bold()
                                Text("197")
                            }
                            HStack(alignment: .firstTextBaseline, spacing: 2) {
                                Text("Win Percentage:").bold()
                                Text("78%")
                            }
                            
                            
                            
                            
                        }
                        .font(.system(size: 9))
                        .foregroundStyle(.black)
                        .lineLimit(2)
                        .minimumScaleFactor(0.8)
                        .multilineTextAlignment(.leading)
                    }
                }
                .padding(.horizontal, 8)
                .padding(.vertical)
                .frame(width: cardWidth * 0.88)
                
                // Detail Card
                ZStack {
                    Rectangle()
                        .foregroundStyle(cardBackground)
                        .frame(width: cardWidth * 0.80, height: 80)
                        .shadow(color: .black.opacity(0.1), radius: 4, x: 15, y: 13)
                        .shadow(color: .black.opacity(0.1), radius: 1, x: 15, y: 13)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("During the most desperate hours of World War Two, a frail young man named Steve Rogers volunteered for a dangerous experiment. Injecting the top secret Super-Soldier serum, he became Captain America, the living symbol of freedom. His body now physically perfect, his fighting skills now virtually equal, Cap joined the war against the Nazis and contributed greatly to the Allied Powers' ultimate victory. Today, he continues that tradition as he fights to defend America against all those forces that would threaten her.")
                    }
                    .font(.system(size: 9))
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.leading)
                    .lineLimit(6)
                    .minimumScaleFactor(0.8)
                    .frame(width: cardWidth * 0.76, alignment: .topLeading)
                    .padding(8)
                }
                .padding()
                
                // Did you know card
                ZStack {
                    Rectangle()
                        .stroke(.black, lineWidth: 1)
                        .frame(width: cardWidth * 0.85, height: 45)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Did You Know:")
                            .bold()
                        Text("Captain America was frozen in Arctic ice for over a decade before the Avengers rescued him!")
                    }
                    .font(.system(size: 8.5))
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: cardWidth * 0.80, alignment: .leading)
                    .padding(.horizontal, 6)
                }
                .padding(.bottom, 42)
            }
        }
    }
}

#Preview {
    BackView()
        .preferredColorScheme(.light)
}
