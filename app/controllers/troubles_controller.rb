class TroublesController < ApplicationController
  def create_params
    params.require(:trouble).permit(:vm_name, :user_num, :about, :user_id,:tag_list).merge(trbl_start: generate_trbl_start(params),trbl_end: generate_trbl_end(params)) ## Rails 4 strong params usage
  end

  def generate_trbl_start(params)
   year = params[:trouble]["trbl_start(1i)"]
   month = params[:trouble]["trbl_start(2i)"]
   date = params[:trouble]["trbl_start(3i)"]
   hour = params[:trouble]["trbl_start(4i)"]
   min =  params[:trouble]["trbl_start(5i)"]

   trbl_start = year+"-"+month+"-"+date+" "+hour+":"+min
  end

    def generate_trbl_end(params)
   year = params[:trouble]["trbl_end(1i)"]
   month = params[:trouble]["trbl_end(2i)"]
   date = params[:trouble]["trbl_end(3i)"]
   hour = params[:trouble]["trbl_end(4i)"]
   min =  params[:trouble]["trbl_end(5i)"]

   trbl_start = year+"-"+month+"-"+date+" "+hour+":"+min
  end

  def index
    @troubles = Trouble.order("id DESC").page(params[:page]).per(10)
  end

  def  new
    @trouble = Trouble.new
    puts @trouble[:vm_name]
  end

  def create
      @trouble = Trouble.create(user_num: create_params[:user_num], about: create_params[:about], vm_name: create_params[:vm_name], trbl_start: create_params[:trbl_start] , trbl_end: create_params[:trbl_end])

    redirect_to controller: :troubles, action: :index
  end

  def update
    @trouble = Trouble.find(params[:id])
    @trouble.update(user_num: create_params[:user_num], about: create_params[:about], vm_name: create_params[:vm_name], trbl_start: create_params[:trbl_start] , trbl_end: create_params[:trbl_end])

    redirect_to controller: :troubles, action: :index
  end

  def show
    @trouble = Trouble.find_by(id: params[:id])
    @comments = Comment.where(trouble_id: params[:id])
  end

  def edit
    @trouble = Trouble.find_by(id: params[:id])
  end

  def search
    @trouble = Trouble.where('title LIKE(?)', "%#{params[:keyword]}%").order("title ASC").page(params[:page]).per(5)
    puts @trouble
  end

end