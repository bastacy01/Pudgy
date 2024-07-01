//
//  DetailView.swift
//  NFTSwift
//
//  Created by Ben Stacy on 12/14/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let item: GridItemData
    var body: some View {
        ScrollView {
            VStack {
                // Header
                VStack(alignment: .leading) {
                    HStack(spacing: -80) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                        
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                            .font(.system(size: 24).bold())
                        }
                        .padding(.horizontal, 25)
                        
                        Spacer()
                        Text("Offers")
                            .font(.system(size: 25))
                            .bold()
                            .padding(.vertical, -5)
                        Spacer()
                    }
                }
//                .padding(.top, 55)
                .padding(.top, 10)
                
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .offset(x: 5, y: 6)
                            .foregroundColor(.black)
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.black, lineWidth: 2)
                            )
                            .overlay(
    //                            Image("GreenPenguin")
    //                                .resizable()
    //                                .scaledToFit()
    //                                .cornerRadius(5)
    //                                .padding()
                                Image(item.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(5)
                                    .padding()
                            )
                    }
                    .frame(width: 300, height: 300)
                }
                .padding()
                .padding(.bottom, 5)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("")
    //            .toolbar(.hidden)
                .navigationBarBackButtonHidden(true)
                
                VStack {
                    HStack(spacing: 20) {
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
                            .frame(width: 75, height: 70)
                        }
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.system(size: 25))
                                .bold()
                            HStack {
                                Text("@TheIglooCompany")
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundColor(.blue)
                            }
                        }
                        Spacer()
                        Image(systemName: "ellipsis")
                    }
                    .padding([.leading, .trailing])
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 7)
                
                Text("Pudgy Penguins is a collection of 8,888 NFT’s, accelerating Web3 innovation through IP utilization and community empowerment.")
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.leading)
    //                .padding([.leading, .trailing])
                    .padding(.horizontal, 20)
                
                HStack(spacing: -15) {
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
                                
                            VStack(spacing: 5) {
                                Text("Price")
                                    .font(.system(size: 18))
                                    .bold().opacity(0.5)
                                Text(item.price)
                                    .font(.system(size: 20))
                                    .bold()
                            }
                        }
                        .frame(width: 115, height: 70)
                    }
                    .padding()
                    .cornerRadius(8)
                    
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
                                
                            VStack(spacing: 5) {
                                Text("Sale ending in")
                                    .font(.system(size: 18))
                                    .bold().opacity(0.5)
                                Text(item.saleEndingIn)
                                    .font(.system(size: 20))
                                    .bold()
                            }
                        }
                        .frame(width: 215, height: 70)
                    }
                    .padding()
                    .cornerRadius(8)
                }
                .padding()
                
                VStack(spacing: -12) {
                    Button(action: {
                        
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
                                        Text("Buy now")
                                            .fontWeight(.bold)
                                            .font(.system(size: 21))
                                            .foregroundColor(.black)
                                    )
                            }
                            .frame(width: 350, height: 65)
                            .padding(.bottom, 40)
                        }
                        .padding(.top, -10)
                    }
                    Button(action: {
                        
                    }) {
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .offset(x: 5, y: 6)
                                    .foregroundColor(.black)
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(Color(.gray))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.black, lineWidth: 2)
                                    )
                                    .overlay(
                                        Text("Make offer")
                                            .fontWeight(.bold)
                                            .font(.system(size: 21))
                                            .foregroundColor(.black)
                                    )
                            }
                            .frame(width: 350, height: 65)
                            .padding(.bottom, 40)
                        }
                        .padding(.top, -10)
                    }
                }
                Spacer()
                
            }
            .navigationBarTitleDisplayMode(.inline)
        }
//        .navigationTitle("Auction")
    }
}

#Preview {
    DetailView(item: GridItemData(imageName: "GreenPenguin", title: "Penguin #4897", price: "11 ETH", lastSalePrice: "Last sale: 10 ETH", saleEndingIn: "1d : 3h : 8m : 54s"))
}
