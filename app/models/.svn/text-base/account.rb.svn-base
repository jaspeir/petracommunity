require 'digest/sha1'
class Account < ActiveRecord::Base
  
  acts_as_ferret :remote => true
  # Virtual attribute for the unencrypted password
  attr_accessor :password
  attr_accessor :agb
  attr_accessible :login, :email, :password, :password_confirmation, :agb

  validates_presence_of     :login, :email
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_acceptance_of   :agb, :message => "AGB müssen akzeptiert werden"
  validates_length_of       :login,    :within => 3..40
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :login, :email, :case_sensitive => false
  before_save :encrypt_password
  before_create :make_activation_code 

  has_one :spec
  has_one :preference

  belongs_to :sponsor, :class_name => "Account", :foreign_key => "sponsor_id"
  has_many :partners, :class_name => "Account", :foreign_key => "sponsor_id"
  
  has_many :pictures
  belongs_to :main_picture, :class_name => "Picture", :foreign_key => "main_picture_id"
  
  has_many :friendships
  has_many :friends, 
           :through => :friendships,
           :conditions => "status = 'accepted'", 
           :order => :login

  has_many :requested_friends, 
           :through => :friendships, 
           :source => :friend,
           :conditions => "status = 'requested'", 
           :order => :created_at

  has_many :pending_friends, 
           :through => :friendships, 
           :source => :friend,
           :conditions => "status = 'pending'", 
           :order => :created_at
           
  has_and_belongs_to_many :groups
  
  
  # Activates the user in the database.
  def activate
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(false)
  end

  def activated?
    # the existence of an activation code means they have not activated yet
    activation_code.nil?
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find :first, :conditions => ['login = ? and activated_at IS NOT NULL', login] # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  # after registration and activation, an account is incomplete
  # that means, it has no associated person and therefore no details
  def complete?
    true if !self.spec.nil? && self.spec.complete?
  end

  def self.find_complete(options = {})
    with_scope :find => options do
      find(:all).select { |e| e.complete? }
    end
  end

  protected
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end
    
    def password_required?
      crypted_password.blank? || !password.blank?
    end
    
    def make_activation_code
      self.activation_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
    end
    
end
