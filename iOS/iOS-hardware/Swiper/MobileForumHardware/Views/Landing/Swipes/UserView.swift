//
//  UserView.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/04.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import SwiftUI
import Combine

struct UserView: View {
    @ObservedObject var user: User
    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            return ZStack(alignment: .leading) {
                AvatarView(url: self.user.profileImage).zIndex(0)
                    
                Text("\(self.userViewModel.superLikes)")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Color.red
                            .blur(radius: 6, opaque: true)
                            .opacity(0.8)
                    )
                    .clipShape(Circle())
                    .position(x: geometry.size.width - 40, y: 40)
                    .zIndex(2)
                
                VStack(alignment: .leading, spacing: 5) {
                    NameView(name: self.user.name, age: self.user.age, gender: self.user.gender.rawValue)
                    SwipeActionBar(likeAction: {
                        self.setUserStatus(.like)
                    }, superLikeAction: {
                        self.setUserStatus(.superLike)
                    }, rejectAction: {
                        self.setUserStatus(.reject)
                    }, status: self.user.status)
                        .padding(.bottom, 10)
                }.zIndex(1)
            }
            .shadow(radius: 12.0)
        }
    }
    
    func setUserStatus(_ status: UserStatus) {
        if status == .superLike {
            if self.userViewModel.superLikes > 0 {
                InMemoryDatabase.shared.currentUser?.increaseSuperLikes(by: -1)
                self.user.configure(status: .superLike)
            }
        } else {
            self.user.configure(status: status)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User(email: "", password: "", name: "Pietie", surname: "Pompies", profileImage: "https://picsum.photos/400", age: 20, gender: .male))
    }
}

class UserViewModel: ObservableObject {
    @Published var superLikes: Int = 0
    var superLikePublisher: AnyCancellable?
    
    init() {
        self.superLikePublisher = InMemoryDatabase.shared.currentUser?.$superLikes.sink(receiveValue: {
            self.superLikes = $0
        })
    }
}
