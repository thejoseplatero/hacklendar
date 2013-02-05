class DiaryEntriesController < ApplicationController

	def index
		
		@diary_entries = DiaryEntry.all

		@diary_entries_count = DiaryEntry.where(mood:'happy').count

	end

end
