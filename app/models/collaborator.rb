class Collaborator < ActiveRecord::Base
	belongs_to :wiki
	belongs_to :user

	validates_presence_of :wiki
	validates_presence_of :user
	validates_uniqueness_of :wiki, scope: :user_id
end
