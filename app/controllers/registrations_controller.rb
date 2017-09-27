class RegistrationsController < ApplicationController
  layout :resolve_layout
  before_action :authorize, :only => [:index]
  before_action :set_registration, only: [:edit, :update, :destroy]

  # GET /registrations
  # GET /registrations.json
  def index
    #@registrations = Registration.all

    @registrations = Registration.all
    if params[:search]
      @registrations = Registration.search(params[:search]).order("created_at DESC")
    else
      @registrations = Registration.all.order('created_at DESC')
    end


  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
    @event = session[:event]
    @name = session[:name]
    #@user_all_event = Event.joins(:registrations).select('events.Title, events.Time, events.Date').where(registrations.Name: @name)
    @user_all_event = Registration.select(:Event).where({Name: @name}).distinct
  end

  # GET /registrations/new
  def new
    @registration = Registration.new
  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(registration_params)

    respond_to do |format|
      if @registration.save
        session[:event] = @registration.Event
        session[:name] = @registration.Name
        format.html { redirect_to registrations_success_path, notice: 'Registration was successfully created.' }
        format.json { render :show, status: :created, location: root_path }
      else
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
    respond_to do |format|
      if @registration.update(registration_params)
        format.html { redirect_to registrations_path, notice: 'Registration was successfully updated.' }
        format.json { render :index, status: :ok, location: root_path }
      else
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to registrations_url, notice: 'Registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_registration
    @registration = Registration.find(params[:id])
  end

  def resolve_layout
    action_name == 'index' ? 'back_layout' : 'front_layout'
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def registration_params
    params.require(:registration).permit(:Name, :Event, :Contact_no, :Email, :College)
  end

end
