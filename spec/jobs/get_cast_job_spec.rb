RSpec.describe GetCastJob, :vcr, type: :job do

  it 'gets the cast member' do
    create(:movie, tmdb_id: 53862)
    GetCastJob.perform_now(53862)
    expect(Movie.where(tmdb_id:53862).length).to eq 1
  end

  it 'gets the cast member id' do
    create(:movie, tmdb_id: 5000)
    GetCastJob.perform_now(5000)
    expect(Role.where(cast_id:1959).length).to eq 1
  end

  it 'gets the character the cast member plays' do
    create(:movie, tmdb_id: 5000)
    GetCastJob.perform_now(5000)
    expect(Role.where(character_name:"Paulette").length).to eq 1
  end

  it "matches with enqueued job" do
    ActiveJob::Base.queue_adapter = :test
    expect {
      GetPersonJob.perform_later(400)
    }.to have_enqueued_job(GetPersonJob)
  end
end
