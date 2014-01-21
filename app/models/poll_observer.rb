class PollObserver < ActiveRecord::Observer
  observe :poll, :question, :answer

  def after_save(record)
    expire_cache_for(record)
  end
  
  def after_update(record)
    expire_cache_for(record)
  end
  
  def after_destroy(record)
    expire_cache_for(record)
  end
  
  private
  
  def get_poll(record)
    poll = record if record.class.to_s == 'Poll'
    poll = Poll.find(record.poll_id) if record.class.to_s == 'Question'
    poll = Poll.find(Question.find(record.question_id).poll_id) if record.class.to_s == 'Answer'
    
    poll
  end
  
  def expire_cache_for(record)
    poll = get_poll(record)
    
    Rails.cache.delete("poll_#{poll.slug.parameterize}")
    Rails.cache.delete("views/poll_questions_#{poll.id}")
    Rails.cache.delete("views/polls_menu")
  end
end

