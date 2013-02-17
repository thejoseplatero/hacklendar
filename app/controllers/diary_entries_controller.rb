class DiaryEntriesController < ApplicationController

	def index
		
		@diary_entries = DiaryEntry.all

		@diary_entries_count = DiaryEntry.where(mood:'happy').count

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
