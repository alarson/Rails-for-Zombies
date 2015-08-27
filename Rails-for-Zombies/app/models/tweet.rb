class Tweet < ActiveRecord::Base
	belongs_to :zombie

	validates_presence_of :status
end