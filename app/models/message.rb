class Message < ActiveRecord::Base
  def poke_cow
    cow_msg = `sleep 2 && fortune | cowsay`
    self.update body: cow_msg
  end
end
