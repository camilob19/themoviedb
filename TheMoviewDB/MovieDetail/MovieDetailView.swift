//
//  MovieDetailView.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 12/03/22.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject var viewModel: MovieDetailViewModel
    @StateObject var network = Network()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            if network.connected {
                ScrollView {
                    VStack(spacing: 0) {
                        MovieDetailHeaderView(viewModel: viewModel)
                        MovieDetailGeneralInfo(viewModel: viewModel)
                        MovieDetailOverview(viewModel: viewModel)
                    }
                }
            } else {
                Button(Localized.goBack) {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            network.checkConnection()
        }.onDisappear {
            network.cancelConnection()
        }
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
                        .font(.headerFont)
                }
                .padding()
            }
            .foregroundColor(.white)
        }
    }
}

struct MovieDetailGeneralInfo: View {
    var viewModel: MovieDetailViewModel
    
    var body: some View {
        HStack {
            VStack {
                AsyncImage(
                    url: viewModel.posterPath,
                    content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 200, alignment: .center)
                            .cornerRadius(10)
                                   .overlay(RoundedRectangle(cornerRadius: 10)
                                       .stroke(Color.orange, lineWidth: 1))
                                   .shadow(radius: 10)
                    },
                    placeholder: {
                        ProgressView()
                    })
                    
                    .padding()
            }
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    ImageAsset.MovieDetail.starIcon
                    Text(viewModel.popularity)
                }
                HStack {
                    ImageAsset.MovieDetail.clockIcon
                    Text(viewModel.voteAverage)
                }
                HStack {
                    ImageAsset.MovieDetail.calendarIcon
                    Text(viewModel.releaseDate)
                }
                HStack {
                    MovieDetailActionsView(viewModel: viewModel)
                }
                .font(.normalFont)
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .padding(.top, 30)
            .foregroundColor(Color.white)
            .font(.normalFont)
        }
        
        .padding(.top, -118)
        .frame(maxWidth: .infinity, alignment: .top)
        .background(Color.madison)
    }
}

struct MovieDetailScore: View {
    @StateObject var viewModel: MovieDetailViewModel
    
    var body: some View {
        HStack {
            ProgressBar(progress: .constant(viewModel.score))
                .frame(width: 50, height: 50, alignment: .center)
            Text(Localized.score)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .center
        )
    }
}

struct CenteredLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
            configuration.title
        }
    }
}

struct MovieDetailActionsView: View {
    
    @StateObject var viewModel: MovieDetailViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            Button {
                viewModel.setFavorites()
            } label: {
                Label(Localized.favorite, systemImage: "heart")
            }
            
            Button {
                viewModel.setLikeMovie()
            } label: {
                if viewModel.getLikeMovie() {
                    Label(Localized.like, systemImage: "hand.thumbsup.fill")
                        .accessibilityIdentifier(Localized.idLikeFill)
                } else {
                    Label(Localized.like, systemImage: "hand.thumbsup")
                        .accessibilityIdentifier(Localized.idNoLikeFill)
                }
            }
            .accessibilityIdentifier(Localized.likeButton)
            
            Button {
                viewModel.setDislikeMovie()
            } label: {
                if viewModel.getdislikeMovie() {
                    Label(Localized.dislike, systemImage: "hand.thumbsdown.fill")
                } else {
                    Label(Localized.dislike, systemImage: "hand.thumbsdown")
                }
            }
        }
        .labelStyle(CenteredLabelStyle())
        .font(.normalFont)
        .foregroundColor(.white)
        .padding(.top, 40)
        Spacer()
    }
}

struct MovieDetailOverview: View {
    @StateObject var viewModel: MovieDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Localized.overview)
                .font(.titleFont)
            Spacer()
            Text(viewModel.overview)
        }
        .padding()
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
