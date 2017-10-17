RSpec.describe GetPersonJob, :vcr, type: :job do

  it 'gets the person' do
    GetPersonJob.perform_now(73968)
    expect(Person.where(tmdb_id:73968).length).to eq 1
  end

  it 'gets the person name' do
    GetPersonJob.perform_now(73968)
    expect(Person.where(tmdb_id:73968).first.name?).to be true
  end

  it "doesn't save person without a picture" do
    GetPersonJob.perform_now(550)
    expect(Person.where(tmdb_id:550).length).to eq 0
  end

  it "gets the person tmdb id" do
    GetPersonJob.perform_now(73968)
    expect(Person.where(tmdb_id:73968).first.tmdb_id?).to be true
  end

  it "gets the person birthday" do
    GetPersonJob.perform_now(73968)
    expect(Person.where(tmdb_id:73968).first.birthday?).to be true
  end

  it "gets the person place of birth" do
    GetPersonJob.perform_now(73968)
    expect(Person.where(tmdb_id:73968).first.born_in?).to be true
  end

  it 'assigns the person to a role' do
    role = create(:role, person_id: nil, cast_id: 73968)
    GetPersonJob.perform_now(73968)
    expect(role.reload.person).not_to be nil
  end
end
