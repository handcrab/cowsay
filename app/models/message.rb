class Message < ActiveRecord::Base
  def self.poke_cow
    #self.update body: cow_msg
    `sleep 3 && fortune | cowsay`
  end
end
