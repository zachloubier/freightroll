Rails.application.routes.draw do
	namespace :api do
		post "/auth/requestsms", to: "auth#request_sms"
		post "/auth/verifysms", to: "auth#verify_sms"
	end

	root 'index#index'
end
