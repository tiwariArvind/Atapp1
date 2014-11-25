class Like < ActiveRecord::Base

	belongs_to :likeable, :polymorphic => true
	belongs_to :user
	belongs_to :event
end
 

     # def unlike?(event)
     # self.likes.find(:all, :conditions => ['event_id = ?', event.id]).size > 0
     # end

	
