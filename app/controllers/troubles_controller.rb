class TroublesController < ApplicationController
  def create_params
    params.require(:trouble).permit(:trbl_start, :trbl_end, :vm_name, :user_num, :about, :user_id,:tag_list) ## Rails 4 strong params usage
  end

  def  new
    @trouble = Trouble.new
    puts @trouble[:vm_name]
  end

  def create
    puts create_params
    @trouble = Trouble.create(user_num: create_params[:user_num], about: create_params[:about], vm_name: create_params[:vm_name])
    redirect_to controller: :troubles, action: :index
  end

  def update
    puts create_params
    @trouble = Trouble.find(params[:id])
    @trouble.update(user_num: create_params[:user_num], about: create_params[:about], vm_name: create_params[:vm_name])
    redirect_to controller: :troubles, action: :index
  end

  def index
    @troubles = Trouble.order("id ASC").page(params[:page]).per(20)
  end

  def show
    @trouble = Trouble.find_by(id: params[:id])
  end

  def edit
    @trouble = Trouble.find_by(id: params[:id])
  end

  def search
    @trouble = Trouble.where('title LIKE(?)', "%#{params[:keyword]}%").order("title ASC").page(params[:page]).per(20)
    puts @trouble
  end

end