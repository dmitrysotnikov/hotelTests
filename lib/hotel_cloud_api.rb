class HotelCloudApi

  require 'factory_girl_client'

  def initialize
    url =  "#{(EnvConfig.get :url)}/"
    @fg = FactoryGirlClient.new(url, (EnvConfig.get :api_username), (EnvConfig.get :api_password))
  end

  def create_user(email, first_name, last_name)
   res = @fg.create(:visitor, first_name: first_name, last_name: last_name, email: email, password: (EnvConfig.get :email_password))
  end

  def delete_user(id)
    @fg.destroy :visitor, id
  end

end