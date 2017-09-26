class EventcoordinatorsController < ApplicationController
  layout "back_layout"
  before_action :authorize
  before_action :set_eventcoordinator, only: [ :edit, :update, :destroy]

  # GET /eventcoordinators
  # GET /eventcoordinators.json
  def index
    @eventcoordinators = Eventcoordinator.all
  end

  # GET /eventcoordinators/1
  # GET /eventcoordinators/1.json
  def show
  end

  # GET /eventcoordinators/new
  def new
    @eventcoordinator = Eventcoordinator.new
  end

  # GET /eventcoordinators/1/edit
  def edit
  end

  # POST /eventcoordinators
  # POST /eventcoordinators.json
  def create
    @eventcoordinator = Eventcoordinator.new(eventcoordinator_params)

    respond_to do |format|
      if @eventcoordinator.save
        format.html { redirect_to eventcoordinators_path, notice: 'Eventcoordinator was successfully created.' }
        format.json { render :index, status: :created, location: @eventcoordinator}
      else
        format.html { render :new }
        format.json { render json: @eventcoordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventcoordinators/1
  # PATCH/PUT /eventcoordinators/1.json
  def update
    respond_to do |format|
      if @eventcoordinator.update(eventcoordinator_params)
        format.html { redirect_to eventcoordinators_path, notice: 'Eventcoordinator was successfully updated.' }
        format.json { render :index, status: :ok, location: @eventcoordinator }
      else
        format.html { render :edit }
        format.json { render json: @eventcoordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventcoordinators/1
  # DELETE /eventcoordinators/1.json
  def destroy
    @eventcoordinator.destroy
    respond_to do |format|
      format.html { redirect_to eventcoordinators_url, notice: 'Eventcoordinator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_eventcoordinator
    @eventcoordinator = Eventcoordinator.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def eventcoordinator_params
    params.require(:eventcoordinator).permit(:Event, :Name, :Contact_no, :Email)
  end
end
