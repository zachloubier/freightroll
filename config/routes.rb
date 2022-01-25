Rails.application.routes.draw do
	namespace :api do
		post "/auth/requestsms", to: "auth#request_sms"
		post "/auth/verifysms", to: "auth#verify_sms"
		post "/job", to: "job#create"
	end

	get "/request", to: "index#request_sms"
	get "/verify", to: "index#verify_sms"
	get "/job", to: "index#submit_job"

	root "index#request_sms"
end
