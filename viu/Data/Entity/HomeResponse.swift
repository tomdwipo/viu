//
//  HomeResponse.swift
//  viu
//
//  Created by Tommy-amarbank on 16/08/22.
//

import Foundation

struct HomeElement: Codable, Hashable {
    var label: String?
    var nbVisits, nbHits, sumTimeSpent, nbHitsWithTimeGeneration: Int?
    var minTimeGeneration, maxTimeGeneration: String?
    var sumBandwidth, nbHitsWithBandwidth: Int?
    var minBandwidth, maxBandwidth: Int?
    var sumDailyNbUniqVisitors, entryNbVisits, entryNbActions, entrySumVisitLength: Int?
    var entryBounceCount, exitNbVisits, sumDailyEntryNbUniqVisitors, sumDailyExitNbUniqVisitors: Int?
    var avgBandwidth, avgTimeOnPage: Int?
    var bounceRate, exitRate: String?
    var avgTimeGeneration: Double?
    var date: String?

    enum CodingKeys: String, CodingKey {
        case label
        case nbVisits = "nb_visits"
        case nbHits = "nb_hits"
        case sumTimeSpent = "sum_time_spent"
        case nbHitsWithTimeGeneration = "nb_hits_with_time_generation"
        case minTimeGeneration = "min_time_generation"
        case maxTimeGeneration = "max_time_generation"
        case sumBandwidth = "sum_bandwidth"
        case nbHitsWithBandwidth = "nb_hits_with_bandwidth"
        case minBandwidth = "min_bandwidth"
        case maxBandwidth = "max_bandwidth"
        case sumDailyNbUniqVisitors = "sum_daily_nb_uniq_visitors"
        case entryNbVisits = "entry_nb_visits"
        case entryNbActions = "entry_nb_actions"
        case entrySumVisitLength = "entry_sum_visit_length"
        case entryBounceCount = "entry_bounce_count"
        case exitNbVisits = "exit_nb_visits"
        case sumDailyEntryNbUniqVisitors = "sum_daily_entry_nb_uniq_visitors"
        case sumDailyExitNbUniqVisitors = "sum_daily_exit_nb_uniq_visitors"
        case avgBandwidth = "avg_bandwidth"
        case avgTimeOnPage = "avg_time_on_page"
        case bounceRate = "bounce_rate"
        case exitRate = "exit_rate"
        case avgTimeGeneration = "avg_time_generation"
    }
}

typealias HomeResponse = [String: [HomeElement]]
