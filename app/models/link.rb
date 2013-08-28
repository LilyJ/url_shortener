class Link < ActiveRecord::Base
  belongs_to :user
  before_save :gen_short_url


  def gen_short_url
    uuid = Base32::Crockford.encode(55555 + Link.last.id)  
    self.short_url = uuid
  end

end
