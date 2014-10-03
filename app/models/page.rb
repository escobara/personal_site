class Page < ActiveRecord::Base
	has_ancestry
	
	PAGE_TYPE = %w(Home News Video Contact About Portfolio Blog)

	validates_presence_of :title, :body
	validates_uniqueness_of :title
	# validates :page_type, inclusion: PAGE_TYPE

	# Callbacks - be sure they don't interact with other models
	# Scopes 
	scope :home, -> { where(page_type: 'Home', is_published: 1).limit(1) }


end
