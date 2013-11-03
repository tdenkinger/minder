require "dm-validations"

module DB
  class Status < Struct.new(:status, :message)
  end

  class Users
    include DataMapper::Resource

    validates_presence_of :username, :email, :password

    property :id, Serial
    property :username, String, :required => true, :key => true
    property :email, String, :required => true, :key => true
    property :password, String, :required => true
    property :created_at, DateTime
    property :updated_at, DateTime
    property :is_reset, Boolean, :required => true, :default => false
    property :reset_at, DateTime
    property :salt, String
    property :reset_password, String
    property :api_key, String, :required => true, :default => SecureRandom.hex

    def self.register params
      user = create_new_user params
      compile_status user
    end

    def self.compile_status user
      if user.saved?
        Status.new("ok", user[:api_key])
      else
        Status.new("error", get_errors(user))
      end
    end

    def self.get_errors user
      errors = []
      user.errors.each{|e| errors << e[0] }
      errors
    end

    def self.create_new_user params
      salt = SecureRandom.hex
      password = Digest::SHA1.hexdigest(params[:password] + salt)
      Users.first_or_create({:username => params[:username]},{:password => password, :email => params[:email], :salt => salt})
    end
  end
end
