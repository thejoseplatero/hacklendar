class DiaryEntry < ActiveRecord::Base
attr_accessible :title, :description, :mood

	def happy?
		if mood == "happy"
			'red'
		else
			'black'
	end
end

	def self.by_title(title)
		where(title: title)
	end
end

