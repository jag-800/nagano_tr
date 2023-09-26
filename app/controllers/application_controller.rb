class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_items_path
    else
      # 他のパス
    end
  end

  # def after_sign_out_path_for(resource)
  #   if resource.is_a?(Admin)
  #     admin_items_path
  #   else
  #     # 他のパス
  #   end
  # end

end
