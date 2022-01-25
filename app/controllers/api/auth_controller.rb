class Api::AuthController < ApplicationController
	def request_sms
		driver = Driver.find_by(phone: params[:phone])

		if driver
			if driver.send_sms_code()
				# The sms code would have been sent to the driver above, but for this practice, we're just returning the code here
				render json: {sms_code: driver.sms_code}
			else
				render json: {errors: ["Failed to send SMS code"]}, status: :bad_request
			end
		else
			render json: {errors: ["Driver not found"]}, status: :not_found
		end
	end

	def verify_sms
		driver = Driver.find_by(phone: params[:phone])

		if driver
			if driver.sms_code == params[:sms_code]
				# Clear out SMS code after it's been verified
				driver.update(sms_code: nil)
				render json: driver
			else
				render json: {errors: ["Invalid SMS code"]}, status: :unauthorized
			end
		else
			render json: {errors: ["Invalid phone number"]}, status: :not_found
		end
	end
end
