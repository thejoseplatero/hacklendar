class DiaryEntry < ActiveRecord::Base
attr_accessible :title, :description, :mood

validates :title, :presence => true, :uniqueness => true
validates :description, :presence => true
validates :mood, :presence => true

 validate :custom_method

 def custom_method
    if (Time.now.monday? || Time.now.thursday?) && !happy?
    
     errors[:mood] << "must be Happy."
    end
  end
    
 

	def happy?
		mood == "Happy"
		#	'red'
			
		#else
		#	'black'
		
		#end
	end

	def self.by_title(title)
		where(title: title)
	end
end

