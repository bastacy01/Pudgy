//
//  CollectionView.swift
//  NFTSwift
//
//  Created by Ben Stacy on 1/6/24.
//

import SwiftUI

struct CollectionView: View {
    @State private var selectedTab: Int = 0
    let stats = [
        Stat(number: "8.8K", label: "Items"),
        Stat(number: "264.2K", label: "Total Volume"),
        Stat(number: "4.34K", label: "Owners")
    ]
    var body: some View {
        NavigationStack {
            ZStack {
                Color.brown.opacity(0.2).ignoresSafeArea(.all)
                ScrollView {
                    VStack {
                        // Header with horizontally scrolling images
                        ScrollView(.horizontal, showsIndicators: false) {
                        }
                        ZStack(alignment: .top) {
                            RoundedRectangle(cornerRadius: 8)
    //                            .fill(Color.gray.opacity(0.5))
                                .frame(width: 380, height: 130)
                                .overlay(
                                    Image("banner")
                                        .resizable()
                                        .cornerRadius(8)
                                        .opacity(0.85)
                                )
                            
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .offset(x: 5, y: 6)
                                        .foregroundColor(.black)
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(.black, lineWidth: 2)
                                        )
                                        .overlay(
                                            Image("Pudgy")
                                                .resizable()
                                                .cornerRadius(8)
                                        )
                                }
                                .frame(width: 100, height: 90)
                            }
                            .padding()
                            .padding(.top, 60)
                        }
                        .padding(.top, -15)
                        // Collection title and verification checkmark
                        VStack {
                            HStack {
                                Text("Pudgy Penguins")
                                    .font(.system(size: 20).monospaced())
                                    .fontWeight(.bold)
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 20))
                            }
                        }
                        .padding(.vertical, 5)
                        
                        // Description text
                        VStack(spacing: 5) {
                            HStack {
                                Text("By")
                                    .font(.system(size: 18).monospaced())
                                    .fontWeight(.regular)
                                HStack(spacing: 5) {
                                    Text("TheIglooCompany")
                                        .font(.system(size: 18).monospaced())
                                        .fontWeight(.bold)
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundColor(.blue)
                                        .font(.system(size: 17))
                                }
                            }
                            Text("Pudgy Penguins is a collection of 8,888 NFT’s, accelerating Web3 innovation through IP utilization and community empowerment.")
                                .multilineTextAlignment(.center)
                                .padding()
                                .font(.system(size: 16))
                                .foregroundColor(.black.opacity(0.7))
                        }
                        
                        VStack {
                            HStack(spacing: 38) {
                                ForEach(stats) { stat in
                                    StatView(stat: stat)
                                        .padding(.horizontal, -12)
                                }
                            }
                            .padding(10)
                            .padding(.horizontal)
                        }
                        .padding(.horizontal, 5)
                        // Stats section
                        // Offer button
                        Button(action: {
                            // Handle button tap
                        }) {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .offset(x: 5, y: 6)
                                        .foregroundColor(.black)
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(Color("SkyColor"))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(.black, lineWidth: 2)
                                        )
                                        .overlay(
                                            Text("Make Collection Offer")
                                                .fontWeight(.bold)
                                                .font(.system(size: 18))
                                                .foregroundColor(.black)
                                        )
                                }
                                .frame(width: 350, height: 65)
                            }
                            .padding(.top, -15)
                        }
                        .padding()
                        
                        // Items and Activity section headers
                        VStack {
                            HStack(spacing: 150) {
                                Text("Items")
                                    .font(.system(size: 18).bold())
                                    .onTapGesture {
                                        withAnimation {
                                            selectedTab = 0
                                        }
                                    }
                                
                                Text("Activity")
                                    .font(.system(size: 18).bold())
                                    .onTapGesture {
                                        withAnimation {
                                            selectedTab = 1
                                        }
                                    }
                            }
                            .padding(.horizontal)
                            
                            Rectangle()
                                .frame(width: 40, height: 5)
                                .foregroundColor(Color("BlueColor"))
                                .cornerRadius(8)
                                .offset(x: selectedTab == 0 ? -107 : 98, y: 0)
                                .animation(.default, value: selectedTab)
                        }
                        .padding(2)
                        .padding(.top, 8)
                        
                        
                        
                        // Items grid
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 15), GridItem(.flexible())], spacing: 20) {
                            // Example item
                            ForEach(items) { item in
                                NavigationLink(destination: DetailView(item: item)) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .offset(x: 6, y: 6)
                                            .foregroundColor(.black)
                                        RoundedRectangle(cornerRadius: 8)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(.black, lineWidth: 5)
                                            )
                                        VStack(spacing: 10) {
                                            Image(item.imageName)
                                                .resizable()
                                                .frame(height: 150)
                                                .cornerRadius(8)
                                            VStack(alignment: .leading, spacing: 10) {
                                                Text(item.title)
                                                    .font(.system(size: 18))
                                                    .fontWeight(.bold)

                                                Text(item.price)
                                                    .fontWeight(.bold)
                                                
                                                Text(item.lastSalePrice)
                                                    .font(.system(size: 15.5))
                                            }
                                        }
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(8)
                                    }
                                    .padding(2)
                                    .foregroundStyle(Color.black)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
}
struct StatView: View {
    let stat: Stat
//    /                        VStack(alignment: .leading) {
    //                            ZStack(alignment: .leading) {
    //                                RoundedRectangle(cornerRadius: 8)
    //                                    .offset(x: 4, y: 6)
    //                                RoundedRectangle(cornerRadius: 5)
    //                                    .foregroundColor(.white)
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .offset(x: 5, y: 6)
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.white)
                    .stroke(Color.black, lineWidth: 2)
            }
            .frame(width: 108, height: 75)
            .overlay(
                VStack(spacing: 8) {
                    Text(stat.number)
                        .fontWeight(.bold)
                    Text(stat.label)
                        .fontWeight(.light)
                }
                .font(.system(size: 16))
            )
        }
    }
}

struct Stat: Identifiable {
    let id = UUID()
    let number: String
    let label: String
}

struct GridItemData: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let price: String
    let lastSalePrice: String
    let saleEndingIn: String
}

let items = [
    GridItemData(imageName: "Penguin2106", title: "Penguin #2106", price: "15 ETH", lastSalePrice: "Last sale: 4.89 ETH", saleEndingIn: "1d : 3h : 8m : 54s"),
    GridItemData(imageName: "Penguin7702", title: "Penguin #7702", price: "17.5 ETH", lastSalePrice: "Last sale: 5.9 ETH", saleEndingIn: "8d : 10h : 7m : 44s"),
    GridItemData(imageName: "Penguin4142", title: "Penguin #4142", price: "20 ETH", lastSalePrice: "Last sale: 2.14 ETH", saleEndingIn: "1d : 1h : 6m : 34s"),
    GridItemData(imageName: "Penguin4945", title: "Penguin #4945", price: "22.5 ETH", lastSalePrice: "Last sale: 5 WETH", saleEndingIn: "28d : 4h : 5m : 24s"),
]

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}

