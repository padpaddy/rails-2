module ApplicationHelper
	def getUserInfo(post_or_comment)
		post_or_comment.user.first_name.capitalize + " " + post_or_comment.user.last_name.capitalize
	end
	def getTimeLeft(created_time)
		seconds = Time.now() - created_time
		minutes = ((seconds/60) % 60).round;
		hours = (seconds/3600).round;
				
		"Created " + (hours > 0 ? (hours.to_s + " hour ") : "") + minutes.to_s + " min ago"
	end
end
