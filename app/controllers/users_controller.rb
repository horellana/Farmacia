class UsersController < ApplicationController
  before_action :find_user, only: [:show]
  before_action :admin_only, only: [:create, :new, :edit]

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.rut = params[:user][:rut]
    @user.password = params[:user][:password]
    @user.admin = params[:user][:admin] == "1"
    @user.office = Office.first

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  private

  def find_user
    @user = User.find_by id: params[:id]

    if not @user
      flash[:alert] = 'No se encontro al usuario'
      redirect_to :root
    end
  end
end
