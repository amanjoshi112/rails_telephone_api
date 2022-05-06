class MobilesController < ApplicationController

 	def index
		@mobileNumber = Mobile.all
		if @mobileNumber.present?
            json_response(@mobileNumber.pluck(:mobile), "List of allocated mobile numbers.",200)
		else
            json_response(@mobileNumber.pluck(:mobile), "Not Found allocated mobile numbers.",200)
		end
		rescue => exception
	 	render json: { success: false, errors: exception.message}, status: 400
	end

    def special_number
        special_number_tmp = params[:mobile]
        if special_number_tmp.present?
            #special_number_tmp = special_number_tmp.gsub!(/\D/, "")
            existing = Mobile.where(mobile: special_number_tmp)
            if existing.present?
                random_number = Mobile.get_random_number
                result = Mobile.create(mobile: random_number)
                json_response(result.mobile, "Sorry #{special_number_tmp} is not available,  New phone number allocated Successfully.",200)
            else
                result = Mobile.new({mobile: special_number_tmp})
                if result.save
                    str =  result.mobile;
                    [3, 7].each { |i| str.insert i, '-' }
                #   render json: {success: true, message: "The special number is allocated", phone_number: str}, status: 200
                	json_response(str,"The special number is allocated",200)
                else
                #   render json: {success: false, error: result.errors}, status: 500 
                  	json_response(nil,result.errors,200)
                end
            end
        else 
            random_number = Mobile.get_random_number
            result = Mobile.create(mobile: random_number)
            str =  result.mobile;
            [4, 7].each { |i| str.insert i, '-' } 
            # render json:{success: true, message: "New phone number allocated Successfully.", phone_number: str}, status: 200
            json_response(str,"New phone number allocated Successfully.", 200)
        end
     end
end
