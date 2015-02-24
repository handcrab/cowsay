class MassageCowJob < ActiveJob::Base
  queue_as :default
  RUN_EVERY = 1.minute  
  # after_perform do |job|
  #   # invoke another job at your time of choice 
  # end

  def perform args={run_every: RUN_EVERY}    
    # call other job
    CowsayJob.perform_later # topic: 'ru'
    self.class.perform_later wait: run_every # re-queue
  end
end
