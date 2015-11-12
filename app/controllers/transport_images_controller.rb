class TransportImagesController < ApplicationController
  before_action :set_transport_image, only: [:show, :edit, :update, :destroy]

  # GET /transport_images
  # GET /transport_images.json
  def index
    @transport_images = TransportImage.all
  end

  # GET /transport_images/1
  # GET /transport_images/1.json
  def show
  end

  # GET /transport_images/new
  def new
    @transport_image = TransportImage.new
    @transport_caption = TransportCaption.find_by_id(params[:transport_caption_id])
  end

  # GET /transport_images/1/edit
  def edit
  end

  # POST /transport_images
  # POST /transport_images.json
  def create
    if !current_user
      format.html { render :new }
      format.json { render json: @transport_image.errors, status: :unprocessable_entity }
      return
    end
    @transport_image = TransportImage.new(transport_image_params)
    @transport_image.path = params[:file]
    @transport_image.user_id = current_user.id
    @transport_caption_id = params[:transport_image][:transport_caption_id]
    respond_to do |format|
      if @transport_image.save
        if @transport_caption_id
          image_in_caption = ImageInCaption.new
          image_in_caption.transport_image = @transport_image
          image_in_caption.transport_caption_id = @transport_caption_id
          image_in_caption.save
        end
        format.html { redirect_to edit_transport_image_path(@transport_image), notice: 'Transport image was successfully created.' }
        format.json { render :edit, status: :created, location: edit_transport_image_path(@transport_image) }
      else
        format.html { render :new }
        format.json { render json: @transport_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transport_images/1
  # PATCH/PUT /transport_images/1.json
  def update


photo_path = Rails.public_path+@transport_image.path.to_s[1..-1]
loot_image = Magick::Image::read(photo_path)[0]
sticker_image = Magick::Image::read(Rails.public_path+(params[:sticker_image][1..-1]))[0]
loot_image = loot_image.composite(sticker_image, params[:x].to_i, params[:y].to_i, Magick::AtopCompositeOp)
out = photo_path.sub(/\./, "-sticker.")
loot_image.format = "PNG"
loot_image.write(out)
@transport_image.stickered_path=@transport_image.path.to_s.to_s.sub(/\./, "-sticker.")
@transport_image.save
redirect_to @transport_image

loot_image.resize!(800, 800)
loot_image.write(Rails.public_path+@transport_image.path_url(:thumb)[1..-1])
loot_image.resize!(250, 250)
loot_image.write(Rails.public_path+@transport_image.path_url(:med_thumb)[1..-1])

#    respond_to do |format|
#      if @transport_image.update(transport_image_params)
#        format.html { redirect_to @transport_image, notice: 'Transport image was successfully updated.' }
#        format.json { render :show, status: :ok, location: @transport_image }
#      else
#        format.html { render :edit }
#        format.json { render json: @transport_image.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # DELETE /transport_images/1
  # DELETE /transport_images/1.json
  def destroy
    @transport_image.destroy
    respond_to do |format|
      format.html { redirect_to transport_images_url, notice: 'Transport image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transport_image
      @transport_image = TransportImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transport_image_params
      params.require(:transport_image).permit(:user_id, :path, :stickered_path)
    end
end
