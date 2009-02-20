class Session < ActiveRecord::Base

  def self.count_active
    @active_session = find(:all, :conditions => ["updated_at > ?", 10.minutes.ago])
    @active_session.size
  end
end