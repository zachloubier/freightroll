class Driver < ApplicationRecord
	def send_sms_code
		return false if phone == nil

		if sms_code == nil
			sms_code = rand(100000..999999)
			update(sms_code: sms_code)
		end

		# Send SMS code here, probably using a service like Twilio
		# Also should have a service to auto-expire sms codes after x number of minutes
		# For now, just return true
		return true
	end
end
