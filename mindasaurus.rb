module Mindasaurus
  class API < Grape::API
    format :json
    formatter :json, Grape::Formatter::Rabl

    get :reminders, :rabl => 'reminders' do
      @reminders = Reminders.retrieve
    end

    get "reminders/reminder/:id", :rabl => "reminder" do
      @reminder = Reminders.retrieve params[:id]
    end

    get "reminders/:api_key" do
      Reminders.retrieve_by_key params[:api_key]
    end

    post :reminders do
      Reminders.add_reminder params[:reminder], params[:api_key]
    end

    post :register do
      user = Users.register params
      {:status => user[:status], :api_key => user[:message] }
    end

    post :login do
      api_key = Users.login params
      {:api_key => api_key}
    end

    get "/version" do
      File.read('version.txt')
    end

  end
end

