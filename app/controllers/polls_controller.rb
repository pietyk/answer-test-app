class PollsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_poll
  
  def show   
    redirect_to root_path, :notice => I18n.t('poll_not_found') if @poll.nil?
  end

  def create
    params['answers'] = [] if params['answers'].nil?
    @score            = @poll.generate_score(params['answers'].reject(&:empty?))
    PollMail.send_score(current_user, @score).deliver
  end
  
  private
  
  def get_poll
    @poll = Rails.cache.fetch("poll_#{params[:id]}") do
      Poll.find(params[:id]) rescue nil
    end
  end
end
