class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    # @profile = Profile.new(profile_params)
    # @profile.user_id = current_user.id
    if @profile.save
      if params[:profile][:image].present?
        @profile.image.attach(params[:profile][:image])
      end
      redirect_to profile_path(@profile), notice: 'Profile created successfully!'
    else
      render :new
    end
  end

  def show
    @profile = current_user.profile
    if @profile.nil?
      redirect_to new_profile_path, alert: 'You need to create a profile first.'
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), notice: 'Profile updated successfully!'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :email, :phone_number, :interest, :age, :dob, :city, :bio , :image)
  end
end
