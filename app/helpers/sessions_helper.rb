module SessionsHelper

	def sign_in(user)
      #below line store the user id encrypted with salt on client browser
      cookies.permanent.signed[:remember_token]=[user.id, user.salt]
      current_user = user
   end
   
   #setter and getter methods to store current user of the session
   def current_user=(user)
      @current_user = user
   end   
   def current_user
      @current_user || get_user_using_remeber_token
   end
   
   def current_user?(user)
      user == current_user
   end

   def signed_in?
      !current_user.nil?
   end

   def sign_out
      #delete the remembered token from cookie and set user to nil
      cookies.delete(:remember_token)
      self.current_user = nil
   end

   def authenticate
      #authenticate user to view or edit proile    
     deny_access unless signed_in?
   end

   def deny_access
      store_path
      redirect_to signin_path, flash: {notice: "Please login..!!"}
   end

   def redirect_back_or_user_path(default)
      redirect_to(session[:return_to]||default)
      session[:return_to] = nil      
   end

   def store_path
      session[:return_to] = request.fullpath
   end

   def store_download_path(path,report)
      case report
      when "farm"
         session[:farm_report_path] = path
      when "crop"
         session[:crop_report_path] = path
      when "soil"
         session[:soil_report_path] = path
      else
         nil
      end
   end

   def clear_download_path(report)
      case report
      when "farm"
         session[:farm_report_path] = nil
      when "crop"
         session[:crop_report_path] = nil
      when "soil"
         session[:soil_report_path] = nil
      else
         nil
      end
   end

   def get_download_path(report)
      case report
      when "farm"
         session[:farm_report_path] || nil
      when "crop"
         session[:crop_report_path] || nil
      when "soil"
         session[:soil_report_path] || nil
      else
         nil
      end
   end
   private
   
      def get_user_using_remeber_token
         #*[1,2] interprets as 2 values/array otherwise as one value
         #find the below method in Users model
         User.authenticate_with_salt(*remember_token)
      end
   
      def remember_token
         #returns the user id and salt that is stored in the cookie or nothing
         cookies.signed[:remember_token] || [nil, nil]
      end
end