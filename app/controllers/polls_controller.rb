class PollsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    Rails.logger.info("poll_#{params[:id].parameterize}")
    @poll = Rails.cache.fetch("poll_#{params[:id]}") do
      Poll.find(params[:id]) rescue nil
    end
    
    redirect_to root_path, :notice => I18n.t('poll_not_found') if @poll.nil?
  end

  def create
    params['answers'] = [] if params['answers'].nil?
    @score            = Poll.find(params[:id]).generate_score(params['answers'].reject(&:empty?))
    PollMail.send_score(current_user, @score).deliver
  end
end
