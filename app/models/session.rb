class Session < ActiveRecord::Base
  attr_accessor :login, :password,:match,:remember_me,:timeout, :session_date
  
  belongs_to :user

  before_validation :authenticate_user

  validates_presence_of :match,
    :message => 'badlogin',
    :unless => :session_has_been_associated?
 
  before_save :associate_session_to_user

  private
  def authenticate_user
    unless session_has_been_associated?
      self.match = User.authenticate(self.login, self.password)
    end
  end
 
  def associate_session_to_user
    self.user_id ||= self.match.id
    self.session_id = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
  end
 
  def session_has_been_associated?
    self.user_id
  end  
  
end