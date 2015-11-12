class TransportCaptionsController < ApplicationController
  before_action :set_transport_caption, only: [:show, :edit, :update, :destroy]

  # GET /transport_captions
  # GET /transport_captions.json
  def index
    @transport_captions = TransportCaption.all
  end

  # GET /transport_captions/1
  # GET /transport_captions/1.json
  def show
  end

  # GET /transport_captions/new
  def new
    @transport_caption = TransportCaption.new
  end

  # GET /transport_captions/1/edit
  def edit
  end

  # POST /transport_captions
  # POST /transport_captions.json
  def create
    @transport_caption = TransportCaption.new(transport_caption_params)

    respond_to do |format|
      if @transport_caption.save
        format.html { redirect_to @transport_caption, notice: 'Transport caption was successfully created.' }
        format.json { render :show, status: :created, location: @transport_caption }
      else
        format.html { render :new }
        format.json { render json: @transport_caption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transport_captions/1
  # PATCH/PUT /transport_captions/1.json
  def update
    respond_to do |format|
      if @transport_caption.update(transport_caption_params)
        format.html { redirect_to @transport_caption, notice: 'Transport caption was successfully updated.' }
        format.json { render :show, status: :ok, location: @transport_caption }
      else
        format.html { render :edit }
        format.json { render json: @transport_caption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transport_captions/1
  # DELETE /transport_captions/1.json
  def destroy
    @transport_caption.destroy
    respond_to do |format|
      format.html { redirect_to transport_captions_url, notice: 'Transport caption was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transport_caption
      @transport_caption = TransportCaption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transport_caption_params
      params.require(:transport_caption).permit(:caption)
    end
end
