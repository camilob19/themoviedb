//
//  MovieDetailView.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 12/03/22.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject var viewModel: MovieDetailViewModel
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    MovieDetailHeaderView(viewModel: viewModel)
                    MovieDetailActionsView(viewModel: viewModel)
                    MovieDetailOverview(viewModel: viewModel)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MovieDetailHeaderView: View {
    
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var viewModel: MovieDetailViewModel
    
    var body: some View {
        ZStack {
            AsyncImage(
                url: viewModel.backgroundImageURL,
                content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: screenWidth, maxHeight: .infinity)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                        .clipped()
                },
                placeholder: {
                    ProgressView()
                })
            
            VStack {
                VStack {
                    Text(viewModel.title)
                        .fontWeight(.bold)
                        .font(Font.system(size: 28))
                }
                HStack {
                    VStack {
                        AsyncImage(
                            url: viewModel.posterPath,
                            content: { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 200, alignment: .leading)
                            },
                            placeholder: {
                                ProgressView()
                            })
                            .padding()
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "star")
                            Text(viewModel.popularity)
                        }.padding(.top, 2)
                        HStack {
                            Image(systemName: "clock")
                            Text(viewModel.voteAverage)
                        }.padding(.top, 2)
                        HStack {
                            Image(systemName: "calendar")
                            Text(viewModel.releaseDate)
                        }
                        .padding(.top, 2)
                    }
                    .font(Font.system(size: 16))
                    .padding()
                }
                .padding()
            }
            .foregroundColor(.white)
        }
    }
}

struct MovieDetailGeneralInfo {
    var movie: Movie
    
    var body: some View {
        VStack {
            
        }
    }
}

struct MovieDetailScore: View {
    @StateObject var viewModel: MovieDetailViewModel
    
    var body: some View {
        HStack {
            ProgressBar(progress: .constant(viewModel.score))
                .frame(width: 50, height: 50, alignment: .center)
            Text("User Score")
        }
        .frame(
            maxWidth: .infinity,
            alignment: .center
        )
    }
}

struct MovieDetailActionsView: View {
    
    @StateObject var viewModel: MovieDetailViewModel
    
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "heart")
                    .foregroundColor(.red)
                Text("Favorite")
            }
            
            Button {
                viewModel.setLikeMovie()
            } label: {
                if viewModel.getLikeMovie() {
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundColor(.blue)
                        .accessibilityIdentifier("likeFill")
                } else {
                    Image(systemName: "hand.thumbsup")
                        .foregroundColor(.blue)
                        .accessibilityIdentifier("likeNoFill")
                }
                Text("Like")
            }.accessibilityIdentifier("likeButton")
            
            Button {
                viewModel.setdislikeMovie()
            } label: {
                if viewModel.getdislikeMovie() {
                    Image(systemName: "hand.thumbsdown.fill")
                        .foregroundColor(.blue)
                } else {
                    Image(systemName: "hand.thumbsdown")
                        .foregroundColor(.blue)
                }
                Text("Dislike")
            }
        }
        .foregroundColor(.black)
        .frame(maxWidth: .infinity, maxHeight: 120, alignment: .center)
        .padding()
    }
}

struct MovieDetailOverview: View {
    @StateObject var viewModel: MovieDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Overview")
                .fontWeight(.bold)
                .font(Font.system(size: 20))
            Spacer()
            Text(viewModel.overview)
        }.padding()
        VStack {
            MovieDetailScore(viewModel: viewModel)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: MovieDetailViewModel(movie: Movie(adult: true,
                                                                     backdropPath: "/5P8SmMzSNYikXpxil6BYzJ16611.jpg",
                                                                     genreIDS: [1,2,3],
                                                                     id: 414906,
                                                                     originalLanguage: .en,
                                                                     originalTitle: "The Batman",
                                                                     overview: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer",
                                                                     popularity: 4.0,
                                                                     posterPath: "/74xTEgt7R36Fpooo50r9T25onhq.jpg",
                                                                     releaseDate: "2022-03-01",
                                                                     title: "The Batman",
                                                                     video: true,
                                                                     voteAverage: 5.5,
                                                                     voteCount: 1000)))
    }
}
