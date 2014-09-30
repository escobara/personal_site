class Page < ActiveRecord::Base
	PAGE_TYPE = %w(Home News Video Contact About Portfolio Blog)

	validates_presence_of :title, :body
	validates_uniqueness_of :title
	validates :page_type, inclusion: PAGE_TYPE
	validates_uniqueness_of :page_type, case_sensitivity: false 

	# Callbacks - be sure they don't interact with other models
	# Scopes 
	scope :home, -> { where(page_type: 'Home')}


end
