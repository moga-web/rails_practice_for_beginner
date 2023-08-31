class ProfilesController < ApplicationController
    before_action :set_user, only: %i[edit update]

    def show
        @user = User.find(current_user.id)
    end

    def edit; end

    def update
        if @user.update(user_params)
        redirect_to profile_path(@user), success: 'プロフィールを更新しました'
        else
        flash.now[:danger] = 'プロフィールの更新に失敗しました'
        render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :avatar)
    end

    def set_user
        @user = User.find(current_user.id)
    end
end
