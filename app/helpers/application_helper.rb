module ApplicationHelper
  def polls
    Poll.order('created_at DESC').limit(15).all
  end
end
