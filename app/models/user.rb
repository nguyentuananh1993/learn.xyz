class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :user_logs
  has_many :goal_of_readings
  has_many :goals
  has_many :learning_logs
  
  def status_with friend_id
    if friend = Friend.where(user_id: self.id, friend_id: friend_id).try(:first)
      if friend
        :be_accepted
      else
        :requested
      end
      elsif friend = Friend.where(user_id: friend_id, friend_id: self.id).try(:first)
        if friend
          :accepted
        else
          :be_requested
        end
        else
          :nothing
        end
  end
  
  def friends
    Friend.where("user_id = ? or friend_id = ?", self.id, self.id)
  end

end
