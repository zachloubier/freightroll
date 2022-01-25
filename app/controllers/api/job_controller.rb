class Api::JobController < ApplicationController
	def create
		begin
			driver = Driver.find(params[:driver_id])

			job = driver.jobs.create(job_params)
			if job.id
				render json: job
			else
				errors = []
				job.errors.full_messages().each do |err|
					errors.push(err)
				end

				render json: {errors: errors}, status: :bad_request
			end
		rescue => exception
			render json: {errors: ["Failed to create job. Message: #{exception.message}"]}, status: :not_found
		end
	end

	private
		def job_params
			params.require(:job).permit(:name, :company_name, :reference_number)
		end
end
