class BlockedsController < ApplicationController
  before_action :set_blocked, only: %i[ show edit update destroy ]

  # GET /blockeds or /blockeds.json
  def index
    @blockeds = Blocked.all
  end

  # GET /blockeds/1 or /blockeds/1.json
  def show
  end

  # GET /blockeds/new
  def new
    @blocked = Blocked.new
  end

  # GET /blockeds/1/edit
  def edit
  end

  # POST /blockeds or /blockeds.json
  def create
    @blocked = Blocked.new(blocked_params)

    respond_to do |format|
      if @blocked.save
        format.html { redirect_to blocked_url(@blocked), notice: "Blocked was successfully created." }
        format.json { render :show, status: :created, location: @blocked }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blocked.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blockeds/1 or /blockeds/1.json
  def update
    respond_to do |format|
      if @blocked.update(blocked_params)
        format.html { redirect_to blocked_url(@blocked), notice: "Blocked was successfully updated." }
        format.json { render :show, status: :ok, location: @blocked }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blocked.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blockeds/1 or /blockeds/1.json
  def destroy
    @blocked.destroy!

    respond_to do |format|
      format.html { redirect_to blockeds_url, notice: "Blocked was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blocked
      @blocked = Blocked.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blocked_params
      params.require(:blocked).permit(:blocked_site)
    end
end
