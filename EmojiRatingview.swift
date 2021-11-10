//
//  EmojiRatingview.swift
//  Bookworm
//
//  Created by Василий Буланов on 11/10/21.
//

import SwiftUI

struct EmojiRatingview: View {
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            return Text("😞")
        case 2:
            return Text("😔")
        case 3:
            return Text("😒")
        case 4:
            return Text("😏")
        default:
            return Text("🤩")
        }
    }
}

struct EmojiRatingview_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingview(rating: 3)
    }
}
