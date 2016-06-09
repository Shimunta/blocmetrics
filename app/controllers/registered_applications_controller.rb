class RegisteredApplicationsController < ApplicationController
  before_action :find_id, only: [:show, :update, :edit, :destroy]
  def index
    @registered_applications = current_user.registered_applications
  end

  def show
  end

  def edit
  end

  def update
    if @registered_application.update_attributes(app_params)
      flash[:notice] = "App updated and tracking"
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error updating the app"
      render edit_registered_application_path(@registered_application)
    end
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = current_user.registered_applications.new(app_params)

    if @registered_application.save
      flash[:notice] = "App saved and tracking"
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error setting up app"
      render :new
    end
  end

  def destroy
    if @registered_application.destroy
      flash[:notice] ="\"#{@registered_application.name}\" was deleted"
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  private

  def find_id
    @registered_applicaiton = current_user.registered_applications.find(params[:id])
  end

  def app_params
    params.require(:registered_application).permit(:name, :URL)
  end

end
