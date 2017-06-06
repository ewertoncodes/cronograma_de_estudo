class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end
  
  def create
    @activity = Activity.new(activity_params)
     
    if @activity.save
      redirect_to @activity
    else
      render "new"
    end
  end
  
  def show
    @activity = Activity.find(params[:id])
  end
  
  def index
    @activities = Activity.all_for_created_at_desc
  end

  def increase_priority
    @activity = Activity.find(params[:id])
    @activity.increase_priority(@activity.priority)

    respond_to do |format|
      format.js
      format.json { render json: @activity, status: :created, location: @activity }
    end
  end

  private
    def activity_params
      params.require(:activity).permit(:name, :description, :period)
    end
end
