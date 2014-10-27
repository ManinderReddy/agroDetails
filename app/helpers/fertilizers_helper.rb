module FertilizersHelper

	def hold_selected_crop(crop)
      cookies.permanent[:crop_token]=[crop.id]
      selected_crop = crop
   end
   #setter and getter methods to store current crop temporarily
   def selected_crop=(crop)
      @selected_crop = crop
   end   
   def selected_crop
      @selected_crop || get_crop_using_token
   end
   
   def selected_crop?(crop)
      crop == selected_crop
   end

   def is_selected_crop_nil?
      !selected_crop.nil?
   end

   def clear_selected_crop
      #delete the crop token from cookie and set crop to nil
      if !crop_token.nil?
      	logger.debug crop_token
      	cookies.delete(:crop_token)
      	self.selected_crop = nil
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
   
      def get_crop_using_token
         Crop.search(crop_token)
      end
   
      def crop_token
         cookies[:crop_token] || nil
      end

end
