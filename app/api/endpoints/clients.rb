module Endpoints
  class Clients < Grape::API
    format :json

    resource :clients do

      get '/' do
        @client = Client.find(:id)

        if @client.is_nil?
          error!({ :error => "client could not be found", :details => @client.errors }, 400)
        else
          @client.as_json
        end
      end

      desc "Post a new client information"
      params do
        requires :username, type: String, desc: "username for client"
        requires :pass, type: String, desc: "password for client"
        requires :status, type: Boolean, desc: "status for the client"
      end
      post do
        @client = Client.new
        @client.username = params[:username]
        @client.pass = params[:pass]
        @client.status = params[:status]

        #{}"Client with #{@client.username}  #{@client.pass} #{@client.status} wants to post"
        if @client.save
          status 201
          @client.as_json
        else # user didn't save
          error!({ :error => "user could not be registered", :details => @client.errors }, 400)
        end
      end
    end # clients
  end # Clients
end