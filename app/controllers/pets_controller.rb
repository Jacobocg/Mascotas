class PetsController < ApplicationController
  def show
    @pet = Pet.find_by user_id: params[:user_id], id: params[:id]
    @user = User.find(params[:user_id])
  end

  def new
    @breed = Breed.select('breed')
    @user = User.find(params[:user_id])
    @pet = Pet.new
  end

  def edit
    @user = User.find(params[:user_id])
    @breed = Breed.select('breed')
    @pet = Pet.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    # pets_user = Pet.find_by user_id: params[:user_id]
    num_pets_user = Pet.where(user_id: params[:user_id]).count
    if num_pets_user < 5
      @pet = @user.pets.create(pet_params)
    end
    redirect_to user_path(@user)
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to user_path(@pet.user_id)
    else
      render 'edit'
    end
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :age, :sex, :breed, :alive)
    end
end
