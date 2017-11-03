class ScansController < ApplicationController

	def authentication
		if params[:password] == gramercy_tech_password
			session[:scan_user] = {:auth_token => "", :reader_id => "", :scan_action => ""}
		else
			flash[:notice]= "Invalid password."
			redirect_to password_url
		end
	end

	def reader
		if session[:scan_user].nil?
			redirect_to password_url
		else
			if params[:auth_token].nil?
			else
				session[:scan_user]["auth_token"] = params[:auth_token]
				# Change url below for different event
				@readers = HTTParty.get "",
				headers:{
					"X-AUTH-TOKEN" => session[:scan_user]["auth_token"],
				}
				if !(allowed_tokens.include? session[:scan_user]["auth_token"])
					message = @readers["message"].gsub(".","")
					flash[:notice]= message +=" with that auth token."
					redirect_to password_url
				end
			end
		end
	end

	def action
		if session[:scan_user].nil?
			redirect_to password_url
		else
			if params[:reader_id].nil?
			else
				session[:scan_user]["reader_id"] = params[:reader_id]
			end
		end
	end

	def scan
		if params[:scan_action].nil?
		else
			session[:scan_user]["scan_action"] = eval(params[:scan_action])[:url]
			@option = eval(params[:scan_action])[:option]
		end

		if session[:scan_user].nil? || session[:scan_user]["auth_token"] == "" || session[:scan_user]["reader_id"] == "" || session[:scan_user]["scan_action"] == ""
		else
			@response = HTTParty.get session[:scan_user]["scan_action"],
		  headers:{
		    "X-AUTH-TOKEN" => session[:scan_user]["auth_token"],
		  }
		  statuses = ["BLACKLIST","INVALID - NO ATTENDEE","VALID","PRINT_RECONCILED","CHECKED_IN","DISTRIBUTED","INVALID"]
		  @info = @response["data"]
		  @total_scans = @response["counts"]["total"]
		  @good_scans = @response["counts"]["valid"]
		  @invalid_scans = @response["counts"]["invalid"]
		  @black_scans = @response["counts"]["blacklisted"]
		end
	end

	def password
	end

	def delete_session
		session.delete("scan_user")
		redirect_to password_url
	end

	def help
	end

	private
end