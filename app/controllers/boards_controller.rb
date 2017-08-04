class BoardsController < ApplicationController
	def index
		@boards = Board.all
	end

	def show
		@board = Board.find(params[:id])
		@sounds = @board.sounds
	end

	def new
		@board = Board.new
	end

	def edit
		@board = Board.find(params[:id])
	end

	def add_sounds
		
		@board = Board.find(params[:board_id])


		board_sound = BoardSound.new(board_id: @board.id, sound_id: params[:board][:sound_ids])
		# params[:board][:sound_ids].each do |sound_id|
		# 	byebug
		# 	continue if sound_id.empty?
			
		# 	board_sound = BoardSound.new(board_id: @board.id, sound_id: sound_id)
		# 	if not board_sound.save
		# 		errors << 
		# 	end
		# end
		
		redirect_to :show
	end

	def create
		@board = Board.new(board_params)

		if @board.save
			redirect_to @board
		else
			render :new
		end
	end

	def update
		@board = Board.find(params[:id])
		

		if @board.update(board_params)
			redirect_to @board
		else
			render :edit
		end
	end

	def destroy
		@board = Board.find(params[:id])
		@board.destroy

		redirect_to boards_path
	end

	private

	def board_params
		params.require(:board).permit(:name)
	end
end
