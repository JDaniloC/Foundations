//
//  ProfileCardGrid.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 05/04/23.
//

import SwiftUI

struct ProfileCardGrid: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    @State private var showCard: Bool = false

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        LazyVGrid(
            columns: columns,
            spacing: 20
        ) {
            ForEach(viewModel.profile.cardList) { card in
                Button(action: {
                    viewModel.setTextCardInfo(card: card)
                    showCard.toggle()
                }) {
                    ProfileCard(
                        title: card.title
                    ) {
                        Text(card.description)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(
                                Color("black-color"))
                            .font(.custom("Inter-Regular",
                                          size: 15))
                    }
                }
            }
        }.padding(.all, 20)
         .sheet(isPresented: $showCard) {
             ProfileCardView($viewModel.textCardInfo.title) {
                 if viewModel.textCardInfo.title == "Feedbacks" {
                     Feedbacks()
                 } else {
                     Text(viewModel.textCardInfo.text)
                         .font(.custom("Inter-Regular",
                                       size: 20))
                         .padding(.horizontal, 20)
                 }
             }.presentationDragIndicator(.hidden)
             .presentationDetents([.medium, .large])
         }
    }
}

struct ProfileCardGrid_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var viewModel: ProfileViewModel = ProfileViewModel()
        ProfileCardGrid().environmentObject(viewModel)
    }
}
