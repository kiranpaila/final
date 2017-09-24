class FundsController < ApplicationController
  layout "back_layout"
  before_action :authorize
  before_action :set_fund, only: [:show, :edit, :update, :destroy]

  # GET /funds
  # GET /funds.json
  def index
    @funds = Fund.all

    @expenses = Expense.all

    @events = Event.all

    @reg_fees = Event.joins(:registrations).select('events.Title, events.Cost, count(registrations.id) as no_of_entries').group('events.Title')

    @total1 = Fund.where(status: 'received').sum(:amount)
    @total2 = Expense.sum(:amount)
    @total3 = 0

    @reg_fees.each do  |f|
      @total3 += f.Cost*f.no_of_entries
    end

    @total = @total1 + @total3 - @total2

  end

  # GET /funds/1
  # GET /funds/1.json
  def show
  end

  # GET /funds/new
  def new
    @fund = Fund.new
  end

  # GET /funds/1/edit
  def edit
  end

  # POST /funds
  # POST /funds.json
  def create
    @fund = Fund.new(fund_params)

    respond_to do |format|
      if @fund.save
        format.html { redirect_to @fund, notice: 'Fund was successfully created.' }
        format.json { render :show, status: :created, location: @fund }
      else
        format.html { render :new }
        format.json { render json: @fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funds/1
  # PATCH/PUT /funds/1.json
  def update
    respond_to do |format|
      if @fund.update(fund_params)
        format.html { redirect_to @fund, notice: 'Fund was successfully updated.' }
        format.json { render :show, status: :ok, location: @fund }
      else
        format.html { render :edit }
        format.json { render json: @fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funds/1
  # DELETE /funds/1.json
  def destroy
    @fund.destroy
    respond_to do |format|
      format.html { redirect_to funds_url, notice: 'Fund was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_fund
    @fund = Fund.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def fund_params
    params.require(:fund).permit(:sponsor, :amount, :status, :event)
  end
end
