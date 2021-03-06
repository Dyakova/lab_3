require 'state_machine'

class Country < ActiveRecord::Base
    validates :name, :presence => true, :uniqueness => true, :format => { :with => /^([A-Z]){1}([a-z]){1,}$/, :message => "should start with capital char"}
    validates :language, :presence => true, :length => { :minimum => 2 }, :format => { :with => /^([a-z]){2,}$/, :message => "should use lower case letters only"}
    validates :state, :presence => true

    attr_accessible :language, :name

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
