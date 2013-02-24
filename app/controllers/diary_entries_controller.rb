class DiaryEntriesController < ApplicationController

	def index

		#@diary_entries = DiaryEntry.all

		if params[:day]
				@day = params[:day].to_date
			else
				@day = Date.today	
		end
		
		@diary_entries = DiaryEntry.where(created_at: @day.beginning_of_day..@day.end_of_day)
		@diary_entries_month = DiaryEntry.where(created_at: @day.beginning_of_month..@day.end_of_month)
		
		#@diary_entries_count = DiaryEntry.where(mood:'happy').count

		@days_of_entries = DiaryEntry.where(created_at: @day.beginning_of_month..@day.end_of_month).map do |diary_entry| 
			diary_entry.created_at.to_date
		end
		
	

		
end

	def show
		@diary_entry = DiaryEntry.find(params[:id])
	end

	def new
		@diary_entry = DiaryEntry.new
	end

	def create
		#render text: params["diary_entry"].to_s

		@diary_entry = DiaryEntry.new params["diary_entry"]

		if @diary_entry.save
			redirect_to diary_entries_path
		else
			render :new
		
		end
	end

	def edit
		@diary_entry = DiaryEntry.find(params[:id])
	end

	def update
		@diary_entry = DiaryEntry.find(params[:id])
		if @diary_entry.update_attributes params[:diary_entry]
			redirect_to diary_entries_path
		
			else
				render :edit
		end

		def destroy
			@diary_entry = DiaryEntry.find(params[:id])
			@diary_entry.destroy
			redirect_to diary_entries_path
		end
	end



end
