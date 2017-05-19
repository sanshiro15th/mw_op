class Trouble < ActiveRecord::Base

scope :get_total, -> (period) { where("date(trbl_start) > ?", 2.months.ago).group("#{period}(trbl_start)").count}

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :causes
  has_many :comments
end
