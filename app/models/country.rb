require 'state_machine'

class Country < ActiveRecord::Base
    validates_presence_of :language, :name, :state
    validates :name, :format => { :with => /([A-Z]){1}([a-z]){1,}/, :message => "There is the country, use the capital char" }
    validates_uniqueness_of :name, :message => "There is that country in the list";

    attr_accessible :language, :name

    validates_presence_of :name, :language, :state

    state_machine :initial => :published do
        state :published, :human_name => 'is new'
        state :unpublished, :human_name => 'is unpublished'
        state :deleted, :human_name => 'is deleted'

    event :unpublish, :human_name => 'Publish' do
        transition :published => :unpublished
    end

    event :remove, :human_name => 'Delete' do
        transition :unpublished => :deleted
        transition :published => :deleted
    end
  end



end
