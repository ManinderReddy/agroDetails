# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  first_name         :string(255)
#  last_name          :string(255)
#  age                :integer
#  phone_no           :integer
#  email              :string(255)
#  address            :string(255)
#  city               :string(255)
#  state              :string(255)
#  country            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#

class User < ActiveRecord::Base
	
	#Attr_Accessor provides setters and getters
	attr_accessor :password

	# attr_accessible will specify which columns can be accessed
	attr_accessible :first_name, :last_name, :age, :phone_no,
						 :email, :address, :city, :state, :country,
						 :password, :password_confirmation
	
	email_regex = /\A[a-z\d]+[._]{0,1}[a-z\d]+@[a-z\d]+\.[a-z\d]{1,}\.?[a-z\d]{1,5}\z/i

	# Validations of user model
	validates :first_name, presence: true,
								  length:{maximum: 50}

	validates :last_name, presence: true,
								 length:{maximum: 50}

	validates :email, presence: true,
							format:{with: email_regex},
							uniqueness:{case_sensitive: true},
							on: :create

	validates :phone_no, length:{within: 10..13}

	validates :address, presence: true,
							  length:{maximum: 100}

	validates :city, presence: true
	validates :state, presence: true
	validates :country, presence: true

	validates :password, presence: true,
								length:{within: 6..10},
								confirmation: true,
								
								if: :password

	# Callbacks on user model
	before_save :encrypt_password, if: :password

	# Association with other models
	has_many :farm_details, dependent: :destroy

	# Functions for user model
	def password_match?(login_password)
		encrypted_password == encrypt(login_password)	
	end
	
	def self.authenticate_with_salt(cookie_id,cookie_salt)
		user = User.find_by_id(cookie_id)
		(user && user.salt == cookie_salt)? user : nil
	end

	def self.authenticate(login_email, login_password)
		user = User.find_by_email(login_email)
		(user && user.password_match?(login_password)) ? user :nil
	end


	private
		def encrypt_password
			self.salt = make_salt(password) if self.new_record?
			self.encrypted_password = encrypt(password)
      end						

      def make_salt(string)
      	secure_hash("#{Time.now.utc}--#{string}")
      end

      def encrypt(string)
			secure_hash("#{salt}--#{string}")
      end

      def secure_hash(string)
      	Digest::SHA1.hexdigest(string)
      end

end
