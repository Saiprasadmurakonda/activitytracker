class TimedsController < ApplicationController
  before_action :set_timed, only: %i[ show edit update destroy ]

  # GET /timeds or /timeds.json
  def index
    @timeds = Timed.all
  end

  # GET /timeds/1 or /timeds/1.json
  def show
  end

  # GET /timeds/new
  def new
    @timed = Timed.new
  end

  # GET /timeds/1/edit
  def edit
  end

  # POST /timeds or /timeds.json
  def create
    @timed = Timed.new(timed_params)

    respond_to do |format|
      if @timed.save
        format.html { redirect_to timed_url(@timed), notice: "Timed was successfully created." }
        format.json { render :show, status: :created, location: @timed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @timed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timeds/1 or /timeds/1.json
  def update
    respond_to do |format|
      if @timed.update(timed_params)
        format.html { redirect_to timed_url(@timed), notice: "Timed was successfully updated." }
        format.json { render :show, status: :ok, location: @timed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @timed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timeds/1 or /timeds/1.json
  def destroy
    @timed.destroy!

    respond_to do |format|
      format.html { redirect_to timeds_url, notice: "Timed was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timed
      @timed = Timed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def timed_params
      params.require(:timed).permit(:timed_site, :timeinmin)
    end
end
