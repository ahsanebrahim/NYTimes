//
//  NYTimesResponseModel.swift
//  NYTimes
//
//  Created by Ahsan Ebrahim Khatri on 12/08/2023.
//

import Foundation

struct NYTimesResponseModel: Codable {
    let status : String?
    let copyright : String?
    let num_results : Int?
    let results : [NewsResults]?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case copyright = "copyright"
        case num_results = "num_results"
        case results = "results"
    }
}

struct MediaMetadata : Codable {
    let url : String?
    let format : String?
    let height : Int?
    let width : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case url = "url"
        case format = "format"
        case height = "height"
        case width = "width"
    }
}

struct Media : Codable {
    let type : String?
    let subtype : String?
    let caption : String?
    let copyright : String?
    let approved_for_syndication : Int?
    let mediaMetadata : [MediaMetadata]?
    
    enum CodingKeys: String, CodingKey {
        
        case type = "type"
        case subtype = "subtype"
        case caption = "caption"
        case copyright = "copyright"
        case approved_for_syndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

struct NewsResults : Codable {
   var uri : String?
   var url : String?
   var id : Int?
   var asset_id : Int?
   var source : String?
   var published_date : String?
   var updated : String?
   var section : String?
   var subsection : String?
   var nytdsection : String?
   var adx_keywords : String?
   var column : String?
   var byline : String?
   var type : String?
   var title : String?
   var abstract : String?
   var des_facet : [String]?
   var org_facet : [String]?
   var per_facet : [String]?
   var geo_facet : [String]?
   var media : [Media]?
   var eta_id : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case uri = "uri"
        case url = "url"
        case id = "id"
        case asset_id = "asset_id"
        case source = "source"
        case published_date = "published_date"
        case updated = "updated"
        case section = "section"
        case subsection = "subsection"
        case nytdsection = "nytdsection"
        case adx_keywords = "adx_keywords"
        case column = "column"
        case byline = "byline"
        case type = "type"
        case title = "title"
        case abstract = "abstract"
        case des_facet = "des_facet"
        case org_facet = "org_facet"
        case per_facet = "per_facet"
        case geo_facet = "geo_facet"
        case media = "media"
        case eta_id = "eta_id"
    }
    
    init() {
        
    }
}
