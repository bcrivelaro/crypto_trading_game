class SyncCurrenciesWorker
  include Sidekiq::Worker

  def perform
    SyncCurrenciesService.call
  end
end
