class Statistic < ActiveRecord::Base
	  include ActiveModel::Serialization

  serialize :username, Array
  serialize :cant, Array

end
