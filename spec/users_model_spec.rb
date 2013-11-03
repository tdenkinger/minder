require "spec_helper"
require_relative "../models/users"

describe DB::Users do
  let(:good_user){
    {:username => "troy", :password => "test", :email => "tdenkinger@gmail.com"}
  }

  let(:bad_user){
    {:username => "troy", :password => "test", :email => ""}
  }

  context "user registration" do
    it "registers a new user" do
      saved = DB::Users.register good_user
      expect(saved[:status]).to eql "ok"
      expect(saved[:message]).not_to be_empty
    end

    it "does not register a user missing required information" do
      saved = DB::Users.register bad_user
      expect(saved[:status]).to eql "error"
      expect(saved[:message][0]).to eql "Email must not be blank"
    end
  end

  context "user login" do
    it "rejects an unkonwn user"
    it "returns the api key for a known user"
  end

end
