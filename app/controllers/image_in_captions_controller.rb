class ImageInCaptionsController < ApplicationController
  before_action :set_image_in_caption, only: [:show, :edit, :update, :destroy]

  # GET /image_in_captions
  # GET /image_in_captions.json
  def index
    @image_in_captions = ImageInCaption.all
  end

  # GET /image_in_captions/1
  # GET /image_in_captions/1.json
  def show
  end

  # GET /image_in_captions/new
  def new
    @image_in_caption = ImageInCaption.new
  end

  # GET /image_in_captions/1/edit
  def edit
  end

  # POST /image_in_captions
  # POST /image_in_captions.json
  def create
    @image_in_caption = ImageInCaption.new(image_in_caption_params)

    respond_to do |format|
      if @image_in_caption.save
        format.html { redirect_to @image_in_caption, notice: 'Image in caption was successfully created.' }
        format.json { render :show, status: :created, location: @image_in_caption }
      else
        format.html { render :new }
        format.json { render json: @image_in_caption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_in_captions/1
  # PATCH/PUT /image_in_captions/1.json
  def update
    respond_to do |format|
      if @image_in_caption.update(image_in_caption_params)
        format.html { redirect_to @image_in_caption, notice: 'Image in caption was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_in_caption }
      else
        format.html { render :edit }
        format.json { render json: @image_in_caption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_in_captions/1
  # DELETE /image_in_captions/1.json
  def destroy
    @image_in_caption.destroy
    respond_to do |format|
      format.html { redirect_to image_in_captions_url, notice: 'Image in caption was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_in_caption
      @image_in_caption = ImageInCaption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_in_caption_params
      params.require(:image_in_caption).permit(:transport_image_id, :transport_caption_id)
    end
end
