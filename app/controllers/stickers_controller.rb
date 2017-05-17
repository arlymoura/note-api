class StickersController < ApplicationController
  before_action :set_sticker, only: [:show, :update, :destroy]
  before_action :update_total_view_count, only: :show

  # GET /stickers
  def index
    @stickers = Sticker.all

    render json: @stickers
  end

  # GET /stickers/1
  def show
    render json: @sticker
  end

  # POST /stickers
  def create
    @sticker = Sticker.new(sticker_params)

    if @sticker.save
      render json: @sticker, status: :created, location: @sticker
    else
      render json: @sticker.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stickers/1
  def update
    if @sticker.update(sticker_params)
      render json: @sticker
    else
      render json: @sticker.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stickers/1
  def destroy
    @sticker.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sticker
      @sticker = Sticker.find(params[:id])
    end

    def update_total_view_count
      @sticker = Sticker.find(params[:id])
      if (@sticker.view_count == 0)
        @sticker.fist_view = DateTime.now()
      end
      @sticker.view_count += 1
      @sticker.save!
    end

    # Only allow a trusted parameter "white list" through.
    def sticker_params
      params.require(:sticker).permit(:name, :body, :view_count, :fist_view, :type_note, :status )
    end
end
