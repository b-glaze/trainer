module ApplicationHelper
	def findPhoto
		url = Gravatar.new(current_user.email).image_url
		url = url + "?s=300"
		return url
	end

	def findLargePhoto
		url = Gravatar.new(current_user.email).image_url
		url = url + "?s=500"
		return url
	end
end