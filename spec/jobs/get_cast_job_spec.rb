RSpec.describe GetCastJob, vcr: {record: :new_episodes}, type: :job do

  it 'gets the cast member' do
    create(:movie, tmdb_id: 53862)
    GetCastJob.perform_now(53862)
    expect(Movie.where(tmdb_id:53862).length).to eq 1
  end

  # it 'gets the cast member character name' do
  #   create(:movie, tmdb_id: 53862)
  #   GetCastJob.perform_now(53862)
  #   expect(Movie.where(tmdb_id:53862).first.character?).to be true
  # end

  it "matches with enqueued job" do
    ActiveJob::Base.queue_adapter = :test
    expect {
      GetPersonJob.perform_later(400)
    }.to have_enqueued_job(GetPersonJob)
  end
end
