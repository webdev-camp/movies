RSpec.describe GetPersonJob, :vcr, type: :job do

  it 'gets the person'do
    GetPersonJob.perform_now(53862)
    expect(Person.where(tmdb_id:53862).length).to eq 1
  end
end
