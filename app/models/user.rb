class User
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Paperclip

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  field :name, type: String
  field :bio, type: String
  field :avatar, type: String
  field :academics, type: String
  field :awards, type: String
  # has_attached_file :avatar
   has_mongoid_attached_file :avatar
   validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
   validates_presence_of :name
    validates_uniqueness_of :name, :email, :case_sensitive => false
  
  # has_many :books

  
  ## Token authenticatable
  field :authentication_token, type: String

  has_many    :books, dependent: :destroy

  ## OAuth ##
  

  attr_accessible :email, :password, :remember_me

  paginates_per 30
  def self.find_by_email(email)
    User.where(email: {
      '$regex' => '^' + Regexp.quote(email) + '$', '$options' => 'i'
    }).first
  end

  def self.find_by_token(token)
    User.where(authentication_token: token).first
  end

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def reset_authentication_token
    self.authentication_token = generate_authentication_token
  end

  def reset_authentication_token!
    reset_authentication_token
    self.save!
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
