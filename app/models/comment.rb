class Comment < ActiveRecord::Base
  belongs_to :trouble

scope :get_total, -> (period) { where("date(created_at) > ?", 2.months.ago).group("#{period}(created_at)").count}

end
