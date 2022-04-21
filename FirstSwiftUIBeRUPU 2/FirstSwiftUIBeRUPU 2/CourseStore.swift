//
//  CourseStore.swift
//  FirstSwiftUIBeRUPU 2
//
//  Created by be RUPU on 28/1/22.
//

import SwiftUI
import Contentful
import Combine

let client = Client(spaceId: "yhgm07gpm9af", accessToken: "wjQGkOGK3bIo3jzCzbrLbMnHYzaxeINSKYu9QsNfjZM")

func getArray(id: String, completion: @escaping([Entry]) -> ()){
    let query = Query.where(contentTypeId: "course")
    
    client.fetchArray(of: Entry.self, matching: query) {result in
        switch result {
        case .success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
        case .failure(let error):
            print(error)
        }
    }
}

class CourseStore: ObservableObject {
    @Published var courses: [Course] = courseData
    
    init() {
        getArray(id: "Course") { (items) in
            items.forEach { (item) in
                self.courses.append(Course(
                    title: item.fields["title"] as! String,
                    subtitle: item.fields["subtitle"] as! String,
                    image: "Card1",
                    logo: "Logo1",
                    color: Color.purple,
                    show: false))
            }
        }
    }
}
