module PicturesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create' || action_name == 'confirm'
      confirm_pictures_path
    elsif action_name == 'edit'
    end
  end
end
