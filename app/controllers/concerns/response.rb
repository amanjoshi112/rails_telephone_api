module Response
    def json_response(object, message, status = :ok)
		# render json: object, message: message, status: status
		render json: {  message: message, phone_numbers: object}, status: status
    end
end
   