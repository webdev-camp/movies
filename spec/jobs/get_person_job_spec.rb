RSpec.describe GetPersonJob, vcr: {record: :new_episodes}, type: :job do

  it 'gets the person' do
    GetPersonJob.perform_now(73968)
    expect(Person.where(tmdb_id:73968).length).to eq 1
  end

  it 'gets the person name' do
    GetPersonJob.perform_now(73968)
    expect(Person.where(tmdb_id:73968).first.name?).to be true
  end

  it 'doesnt save person without a picture' do
    GetPersonJob.perform_now(550)
    expect(Person.where(tmdb_id:550).length).to eq 0
  end

end
