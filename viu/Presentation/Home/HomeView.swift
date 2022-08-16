//
//  HomeView.swift
//  viu
//
//  Created by Tommy-amarbank on 16/08/22.
//

import SwiftUI
protocol HomeDelegate {
    func showDetail(data: HomeElement)
    func refreshData()
}
struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    var delegate: HomeDelegate?
    
    var body: some View {
        VStack(alignment: .trailing) {
            Button {
                delegate?.refreshData()
            } label: {
                Text("Refresh")
            }.padding()
            List(viewModel.contents, id: \.self) { item in
                Button {
                    delegate?.showDetail(data: item)
                } label: {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Date: ")
                            Text(item.date ?? "")
                        }
                        Text(item.label ?? "")
                        Text(item.nbVisits?.description ?? "")
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
