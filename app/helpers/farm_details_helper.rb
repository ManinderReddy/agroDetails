module FarmDetailsHelper

	def hold_selected_farm(farm)
      cookies.permanent[:farm_token]=[farm.id]
      selected_farm = farm
   end
   
   #setter and getter methods to store current farm temporarily
   def selected_farm=(farm)
      @selected_farm = farm
   end   
   def selected_farm
      @selected_farm || get_farm_using_token
   end
   
   def selected_farm?(farm)
      farm == selected_farm
   end

   def is_selected_farm_nil?
      !selected_farm.nil?
   end

   def clear_selected_farm
      #delete the farm token from cookie and set farm to nil
      if !farm_token.nil?
      	logger.debug farm_token
      	cookies.delete(:farm_token)
      	self.selected_farm = nil
   	end
   end

   # def authenticate
   #    #authenticate user to view or edit proile    
   #   deny_access unless signed_in?
   # end

   # def deny_access
   #    store_path
   #    redirect_to signin_path, flash: {notice: "Login to view your profile..!!"}
   # end

   # def redirect_back_or_user_path(default)
   #    redirect_to(session[:return_to]||default)
   #    session[:return_to] = nil      
   # end

   # def store_path
   #    session[:return_to] = request.fullpath
   # end

   private
   
      def get_farm_using_token
         FarmDetail.search(farm_token)
      end
   
      def farm_token
         cookies[:farm_token] || nil
      end
end
