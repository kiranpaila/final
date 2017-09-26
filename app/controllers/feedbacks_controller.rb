class FeedbacksController < ApplicationController
  layout :resolve_layout
  before_action :authorize, :only => [:index]

  def index
    @feedbacks = Feedback.all
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |f|
      if @feedback.save
        #  redirect_to index_about_us_path
        f.html {redirect_to new_feedback_path, notice: 'feedback submitted'}
        f.json {render :new, status: :created, location: :@feedback}
      else
        #  redirect_to index_about_us_path
        f.html {render :new, notice: 'error while submitting, try again' }
        f.json {render json: @feedback.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def resolve_layout
    action_name == 'new' ? 'front_layout' : 'back_layout'
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end
end
