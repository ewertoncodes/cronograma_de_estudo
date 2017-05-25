class ActivitiesController < ApplicationController
  def new
    
  end
  
  def create
    @activity = Activity.new(activity_params)
     
    @activity.save
    redirect_to @activity
    
#    render plain: params[:activity].inspect
  end
  
  def show
    @activity = Activity.find(params[:id])
  end
  
  def index
    @activities = Activity.all
  end
  
  private
  def activity_params
    params.require(:activity).permit(:name, :description)
  end
end
