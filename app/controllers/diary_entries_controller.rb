class DiaryEntriesController < ApplicationController

	def index
		
		@diary_entries = DiaryEntry.all

		@diary_entries_count = DiaryEntry.where(mood:'happy').count

	end

	def new
		@diary_entry = DiaryEntry.new
	end

	def create
		#render text: params["diary_entry"].to_s



		@diary_entry = DiaryEntry.new params["diary_entry"]

		if @diary_entry.title == ''
			#redirect_to new_diary_entry_path
			render :new
		else
			@diary_entry.save
		redirect_to diary_entries_path
	end
end

end
