class Page < ActiveRecord::Base
	PAGE_TYPE = %w(Home News Video Contact About Portfolio Blog)

	validates_presence_of :title, :body
	validates_uniqueness_of :title
	validates :page_type, inclusion: PAGE_TYPE
end
