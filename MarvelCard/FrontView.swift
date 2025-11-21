//
//  FrontView.swift
//  MarvelCard
//
//  Created by Ayush Kumar Singh on 10/14/24.
//

import SwiftUI

struct FrontView: View {
    let cardWidth: CGFloat = 260
    var cardHeight: CGFloat { cardWidth * (10.0 / 7.0) }
    private let cardRed = Color(red: 0.90, green: 0.15, blue: 0.20)
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
                .frame(width: cardWidth, height: cardHeight) // 1:1.4 ratio
                .shadow(radius: 8)
            Rectangle()
                .stroke(.black, lineWidth: 2)
                .frame(width: cardWidth * 0.9, height: cardHeight * 0.9)
            
            Rectangle()
                .foregroundStyle(cardRed)
                .frame(width: cardWidth * 0.9, height: cardHeight * 0.9)
            
            ZStack(alignment: .top) {
                Image("Flag")
                    .resizable()
                    .scaledToFit()
                    .frame(width: cardWidth * 0.84, height: cardHeight * 0.84)
                    .padding(.top, 18)
                
                Image("CaptainAmerica")
                    .resizable()
                    .scaledToFit()
                    .frame(width: cardWidth * 0.84, height: cardHeight * 0.84)
                    .padding(.top, 10)
                
                VStack(spacing: 2) {
                    // Icon between the lines, aligned left
                    HStack {
                        Image("MarvelComicsIcon")
                            .resizable()
                            .frame(width: 20, height: 18)
                            .padding(.leading, 5)
                            .padding(.top, 3)
                        
                        Text("SUPER HEROES")
                            .italic()
                            .foregroundStyle(.white)
                            .fontWeight(.heavy)
                            .padding(.horizontal, 24)
                            .padding(.top, 1)
                    }
                    .frame(width: cardWidth * 0.90, alignment: .leading)
                    
                    // Bottom black line
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: cardWidth * 0.90, height: 1)
                }
                .padding(.top, -5)
                
                // Bottom trailing yellow banner
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.yellow)
                        .frame(width: cardWidth * 0.65, height: 32)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    
                    Text("CAPTAIN AMERICA")
                        .font(.system(size: 14, weight: .heavy))
                        .foregroundStyle(Color.black)
                        .kerning(1.0)
                }
                .rotationEffect(.degrees(-18))
                .offset(x: cardWidth * 0.12, y: cardHeight * 0.70)
            }
        }
    }
}

#Preview {
    FrontView()
        .preferredColorScheme(.light)
}

