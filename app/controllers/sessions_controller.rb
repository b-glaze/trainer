class SessionsController < Devise::SessionsController  
    respond_to :json

    # after_filter :cheese
    # def cheese
    # 	binding.pry
    # end
end 




