//
//  DetailView.swift
//  viu
//
//  Created by Tommy-amarbank on 16/08/22.
//

import SwiftUI


struct DetailView: View {
    var viewModel: DetailViewModel
    
    var body: some View {
        VStack {
            VStack {
                Text(viewModel.data.label ?? "")
                Text(viewModel.data.nbVisits?.description ?? "")
                Text(viewModel.data.nbHits?.description ?? "")
                Text(viewModel.data.sumTimeSpent?.description ?? "")
                Text(viewModel.data.nbHitsWithTimeGeneration?.description ?? "")
                Text(viewModel.data.minTimeGeneration ?? "")
                Text(viewModel.data.maxTimeGeneration ?? "")
            }
            
            VStack {
                Text(viewModel.data.sumBandwidth?.description ?? "")
                Text(viewModel.data.nbHitsWithBandwidth?.description ?? "")
                Text(viewModel.data.minBandwidth?.description ?? "")
                Text(viewModel.data.maxBandwidth?.description ?? "")
                Text(viewModel.data.sumDailyNbUniqVisitors?.description ?? "")
                Text(viewModel.data.entryNbVisits?.description ?? "")
                Text(viewModel.data.entrySumVisitLength?.description ?? "")
            }
          
            VStack{
                Text(viewModel.data.entryBounceCount?.description ?? "")
                Text(viewModel.data.exitNbVisits?.description ?? "")
                Text(viewModel.data.sumDailyEntryNbUniqVisitors?.description ?? "")
                Text(viewModel.data.sumDailyExitNbUniqVisitors?.description ?? "")
                Text(viewModel.data.avgBandwidth?.description ?? "")
                Text(viewModel.data.avgTimeOnPage?.description ?? "")
                Text(viewModel.data.bounceRate?.description ?? "")
            }
            VStack{
                Text(viewModel.data.exitRate?.description ?? "")
                Text(viewModel.data.avgTimeGeneration?.description ?? "")
                Text(viewModel.data.date?.description ?? "")
            }
            
            

        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel())
    }
}
