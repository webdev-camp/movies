RSpec.describe GetMovieJob, type: :job do

  it 'gets the movie'do
    GetMovieJob.perform_now(500)
    expect(Movie.where(tmdb_id:500).length).to eq 1
  end

  it 'movie has poster'do
    GetMovieJob.perform_now(500)
    expect(Movie.where(tmdb_id:500).first.poster?).to be true
  end

  it "matches with enqueued job" do
    ActiveJob::Base.queue_adapter = :test
    expect {
      GetCastJob.perform_later(500)
    }.to have_enqueued_job(GetCastJob)
  end
  #test that movie has correct title
  #test movie has picture
  #test that the get cast job starts
end
