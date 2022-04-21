//
//  CourseDetail.swift
//  FirstSwiftUIBeRUPU 2
//
//  Created by be RUPU on 27/1/22.
//

import SwiftUI

struct CourseDetail: View {
    var course: Course
    @Binding var show: Bool
    @Binding var active: Bool
    @Binding var activeIndex: Int

    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8.0) {
                            Text(course.title)
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                            Text(course.subtitle)
                                .foregroundColor(Color.white.opacity(0.7))
                        }
                        Spacer()
                        ZStack {
                            VStack {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 36, height: 36)
                            .background(.black)
                            .clipShape(Circle())
                            .onTapGesture {
                                self.show = false
                                self.active = false
                                self.activeIndex = -1
                            }
                        }
                    }
                    Spacer()
                    Image(course.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 140, alignment: .top)
                    
                }
                .padding(show ? 30 : 20)
                .padding(.top, show ? 30 : 0)
                //        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
                .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
                .background(course.color)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: course.color .opacity(0.3), radius: 20, x: 0, y: 20)
                
                VStack(alignment: .leading, spacing: 30.0) {
                    Text("Take your SwiftUI couse to the app store with advanced technique like API data, package and CMS")
                    
                    Text("About this course")
                        .font(.title).bold()
                    
                    Text("Take your SwiftUI couse to the app store with advanced technique like API data, package and CMS. Take your SwiftUI couse to the app store with advanced technique like API data, package and CMS.Take your SwiftUI couse to the app store with advanced technique like API data, package and CMSTake your SwiftUI couse to the app store with advanced technique like API data, package and CMSTake your SwiftUI couse to the app store with advanced technique like API data, package and CMSTake your SwiftUI couse to the app store with advanced technique like API data, package and CMSTake your SwiftUI couse to the app store with advanced technique like API data, package and CMS")
                    
                    Text("Take your SwiftUI couse to the app store with advanced technique like API data, package and CMS. Take your SwiftUI couse to the app store with advanced technique like API data,  store with advanced technique like API data, package and CMSTake your SwiftUI couse to the app store with advanced technique like API data, package and CMSTake your SwiftUI couse to the app store with advanced technique like API data, package and CMS")
                }
                .padding(30)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetail(course: courseData[0], show: .constant(true), active: .constant(true), activeIndex: .constant(-1))
    }
}
