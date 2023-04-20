//
//  DynamicsView.swift
//  Dynamics
//
//  Created by Madu on 30/03/23.
//

import SwiftUI

struct Dynamics: View {
    @State var scrollView: Bool = false
    @StateObject var viewModel: CardsList = CardsList()
    
    var body: some View {
        VStack() {
            DynamicsProgress()
            
            Spacer()

            if !scrollView {
                DynamicsCards()
                Button(
                    action: {
                        scrollView.toggle()
                    },
                    label: {
                        Text("Exibir Dinâmicas")
                })
                .offset(y: 52)
            } else {
                DynamicsCardsScroll()
            }
            
            Spacer()
            Spacer()
        }
        .onAppear(perform: {scrollView = false})
        .environmentObject(viewModel)
    }
}


struct Dynamics_Previews: PreviewProvider {
    static var previews: some View {
        Dynamics()
    }
}
