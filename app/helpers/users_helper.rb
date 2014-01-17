module UsersHelper
	# Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = {size:35})
    gravatar_id = Digest::MD5::hexdigest(User.find_by(params[:id]).email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: User.find_by(params[:id]).name, class: "gravatar")
  end
end
