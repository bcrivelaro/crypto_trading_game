# frozen_string_literal: true

class SyncCurrenciesWorker
  include Sidekiq::Worker

  def perform
    # SyncCurrenciesService.call
  end
end
