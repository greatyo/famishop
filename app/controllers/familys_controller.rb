class FamilysController < ApplicationController
  def new
    @family = Family.new
  end
  
  def create
    @family = Family.new(family_params)
    if @family.save
      redirect_to new_user_registration_path(family_id: @family.id, name: @family.name)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def family_params
    params.require(:family).permit(:name).merge(user_count: 0)
  end
end
