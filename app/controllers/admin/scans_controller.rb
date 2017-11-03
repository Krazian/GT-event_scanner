class Admin::ScansController < Admin::BaseController
	def index
	  # all_scans = HTTParty.get "",
				# headers:{
					# "X-AUTH-TOKEN" => "",
				# }
	  if params[:search]
	  	# IF SEARCHING @scans = results USING .include?
	     # @scans = search_all_scans
		else
			# ELSE DISPLAY ALL SCANS
			# @scans = all_scans
		end
	end
end