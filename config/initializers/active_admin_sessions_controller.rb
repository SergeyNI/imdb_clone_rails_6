class ActiveAdmin::Devise::SessionsController 

  def after_sign_in_path_for(resource)
   case resource
    when AdminUser then '/movies'
     else super
   end
  end
 
  def after_sign_out_path_for(resource)
   '/'
  end
 end