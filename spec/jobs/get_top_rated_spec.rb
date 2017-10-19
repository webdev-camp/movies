RSpec.describe GetTopRatedJob, :vcr, type: :job do

  it 'tests the movies are created' do
    ActiveJob::Base.queue_adapter = :test
    expect {
      expect(GetTopRatedJob.perform_now)
    }.to have_enqueued_job().exactly(20)
  end
end
