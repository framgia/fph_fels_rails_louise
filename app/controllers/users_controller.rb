  class UsersController < ApplicationController
    before_action :logged_in_user, only: [:create, :index, :edit, :update, :dashboard, :show, :new]   
    def index
      @users = User.where.not(id: current_user.id).paginate(page: params[:page], per_page:8)
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        log_in @user
        flash[:success] = "Welcome to the E-Learning System"
        redirect_to @user
      else
        render 'new'
      end
    end

    def edit
      @user = current_user
    end

    def update
      @user = current_user

      if @user.update_attributes(user_params)
        flash[:success] = "Account information updated!"
        redirect_to dashboard_url
      else
        render 'edit'
      end
    end

    def dashboard
      @posts = current_user.posts.paginate(page: params[:page], per_page:8)
    end
    
    private 

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
      end
  end
