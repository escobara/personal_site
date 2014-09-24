class Page < ActiveRecord::Base
	PAGE_TYPE = %w(Home News Video Contact Portfolio Blog)

	validates_presence_of :title, :body
	validates :page_type, inclusion: PAGE_TYPE
end
