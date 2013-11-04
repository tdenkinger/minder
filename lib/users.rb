class Users
  def self.register params
    DB::Users.register params
  end

  def self.login params
    DB::Users.login params[:username], params[:password]
  end
end
