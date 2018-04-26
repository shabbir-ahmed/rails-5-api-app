module ExceptionHandler
    extend ActiveSupport::Concern
   
    include do 
        rescue_form ActiveRecord::RecordNotFound do |e|
            json_response({message: e.message}, :not_found)
        end
        
        rescue_form ActiveRecord::RecordInvalid do |e|
           json_response({message: e.message}, :unprocessable_entity) 
        end
    end
end