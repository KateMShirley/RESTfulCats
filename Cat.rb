class Cat < ActiveRecord::Base

  def to_s
    "Cat no: #{self.id} with a name of #{self.name}"
  end 

end
