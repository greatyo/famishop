# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @family = Family.new # ここで@familyを初期化するなど
    render 'devise/registrations/new' # カスタムのビューファイルを指定する
  end

  def create
    family = Family.find_by(id: params[:family_id], name: params[:name])
    if family.present?

      build_resource(email: params[:email], family_id: params[:family_id], nickname: params[:nickname] ,password: params[:password]) # 新しいユーザーを作成
      resource.family_id = family.id # ファミリーを関連付ける
      resource.save # ユーザーを保存

      redirect_to root_path
    else
      render 'devise/registrations/new'
    end
    #super do |user|
      #family = Family.find_by(id: params[:family_id], name: params[:name])
      #user.family_id = family.id if family.present?
      #user.save
    #end
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :password_confirmation, :family_id])
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
