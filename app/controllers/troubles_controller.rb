class TroublesController < ApplicationController
  def trouble_params
    params.require(:trouble).permit(:trbl_start, :trbl_end, :vm_name, :user_num, :about, :user_id,:tag_list) ## Rails 4 strong params usage
  end
end

@trouble = Trouble.new(:vm_name => "Bobby")