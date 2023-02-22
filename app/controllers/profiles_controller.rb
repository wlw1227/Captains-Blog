class ProfilesController < ApplicationControllers
  before_action :authenticate_user!, except: [:show]

  def new
    @profile = Profile.new
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to @profile
    else
      render :new
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :bio)
  end
end