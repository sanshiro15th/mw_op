class CommentsController < ApplicationController

  def create_params
    params.require(:comment).permit(:comment,:trouble_id, :user_id) ## Rails 4 strong params usage
  end

  def index

    @troubles_day = Trouble.get_total("date")
    @troubles_week = Trouble.get_total("week")
    @troubles_month = Trouble.get_total("month")

    if @troubles_day[Date.today]
      @ttoday = @troubles_day[Date.today]
    else
      @ttoday = 0
    end

    if @troubles_day[Date.yesterday]
      @tyesterday = @troubles_day[Date.yesterday]
    else
      @tyesterday = 0
    end

    if @troubles_week[Date.today.cweek]
      @tthisweek = @troubles_week[Date.today.cweek]
    else
      @tthisweek = 0
    end

    if @troubles_week[Date.today.prev_week.cweek]
      @tprevweek = @troubles_week[Date.today.prev_week.cweek]
    else
      @tprevweek = 0
    end

    if @troubles_month[Date.today.month]
      @tthismonth = @troubles_month[Date.today.month]
    else
      @tthismonth = 0
    end

    if @troubles_month[Date.today.prev_month]
      @tprevmonth = troubles_month[Date.today.prev_month]
    else
      @tprevmonth = 0
    end

    @diff_troubles_day = @ttoday-@tyesterday
    @diff_troubles_week = @tthisweek-@tprevweek
    @diff_troubles_month = @tthismonth-@tprevmonth






    @comments =Comment.order("created_at DESC").page(params[:page]).per(5)
    @comments_day = Comment.get_total("date")
    @comments_week = Comment.get_total("week")
    @comments_month = Comment.get_total("month")


    if @comments_day[Date.today]
      @ctoday = @comments_day[Date.today]
    else
      @ctoday = 0
    end

    if @comments_day[Date.yesterday]
      @cyesterday = @comments_day[Date.yesterday]
    else
      @cyesterday = 0
    end

    if @comments_week[Date.today.cweek]
      @cthisweek = @comments_week[Date.today.cweek]
    else
      @cthisweek = 0
    end

    if @comments_week[Date.today.prev_week.cweek]
      @cprevweek = @comments_week[Date.today.prev_week.cweek]
    else
      @cprevweek = 0
    end

    if @comments_month[Date.today.month]
      @cthismonth = @comments_month[Date.today.month]
    else
      @cthismonth = 0
    end

    if @comments_month[Date.today.prev_month]
      @cprevmonth = comments_month[Date.today.prev_month]
    else
      @cprevmonth = 0
    end

    @diff_comments_day = @ctoday-@cyesterday
    @diff_comments_week = @cthisweek-@cprevweek
    @diff_comments_month = @cthismonth-@cprevmonth


    gon.tdata_day = @troubles_day
    gon.cdata_day = @comments_day

    today = Date.today
    gon_date = []
    7.times {
      gon_date << today
      today = today -1
    }
    gon.date = gon_date

  end

  def new
    @trouble = Trouble.find(params[:trouble_id])
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.create(comment: create_params[:comment], trouble_id: params[:trouble_id], user_id: params[:user_id])
    redirect_to controller: :troubles, action: :index
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment: create_params[:comment])
    redirect_to controller: :comments, action: :index
  end
end
