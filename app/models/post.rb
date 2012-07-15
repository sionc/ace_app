class Post < ActiveRecord::Base
  attr_accessible :comment, :owner
end
