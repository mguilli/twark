json.array!(@web_apps) do |web_app|
  json.extract! web_app, :id, :name, :token
  json.url web_app_url(web_app, format: :json)
end
