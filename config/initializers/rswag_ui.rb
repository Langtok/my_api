Rswag::Ui.configure do |config|
  # Define the Swagger endpoint for your API documentation
  # The first parameter is the relative path to the Swagger YAML file
  # The second parameter is the title displayed in the Swagger UI
  config.openapi_endpoint '/api-docs/v1/swagger.yaml', 'API V1 Docs'


  # Optional: Add Basic Auth if your API is private
  # Uncomment and replace 'username' and 'password' with your credentials
  # config.basic_auth_enabled = true
  # config.basic_auth_credentials 'username', 'password'
end
