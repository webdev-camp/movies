RSpec.describe GetGenreJob, :vcr, type: :job do

  it 'gets genres' do
    GetGenreJob.perform_now
    expect(Genre.count).to eq 19
  end

  it 'gets action' do
    GetGenreJob.perform_now
    expect(Genre.where(name: "Action")).to exist
  end

end
