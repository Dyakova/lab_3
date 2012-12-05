class Country < ActiveRecord::Base
    validates_presence_of :language, :name
    validates :name, :format => { :with => /([A-Z]){1}([a-z]){1,}/, :message => "There is the country, use the capital char" }
    validates_uniqueness_of :name, :message => "There is that country in the list";

    attr_accessible :language, :name
end
