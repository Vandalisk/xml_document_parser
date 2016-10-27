class UnzipWorker
  include Sidekiq::Worker

  def perform(file_name)
    Unzipper.new(file_name).unzip!
  end
end
