RSpec.describe GetMovieJob, :vcr, type: :job do

  it 'gets the movie' do
    GetMovieJob.perform_now(500)
    expect(Movie.where(tmdb_id:500).length).to eq 1
  end

  it 'gets movie attributes' do
    GetMovieJob.perform_now(500)
    movie = Movie.where(tmdb_id:500).first
    expect(movie.title?).to be true
    expect(movie.language?).to be true
    expect(movie.budget?).to be true
    expect(movie.revenue?).to be true
    expect(movie.release_date?).to be true
  end

  it 'gets movie poster' do
    GetMovieJob.perform_now(500)
    expect(Movie.where(tmdb_id:500).first.poster?).to be true
  end

  it "matches with enqueued job" do
    ActiveJob::Base.queue_adapter = :test
    expect {
      GetCastJob.perform_later(500)
    }.to have_enqueued_job(GetCastJob)
  end
end
