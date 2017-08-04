class SoundsController < ApplicationController

  def index

  	board_sound_ids = Board.find(params[:board_id]).sounds.pluck(:id)
    @sounds = Sound.where("lower(name) like ? and id not in (?)", "%" + params[:search_str].downcase + "%",   board_sound_ids)
    .limit(5)

		@sounds = @sounds.map.with_index{ |sound, i| { 
			'$order': i+1, 
			value: sound.id, 
			text: sound.name,
			description: sound.description
			}
		}
    render json: @sounds
  end

	def create
		@sound = Sound.new(sound_params)
		if @sound.save
			render json: @sound
		else
			render json: { errors: @sound.errors.full_messages }, :status => 422
		end
	end

	def destroy
		@sound = Sound.find(params[:id])
		@sound.destroy
		redirect_to boards_path
	end

	private

	def sound_params
		params.require(:sound).permit(:name, :description)
	end
end