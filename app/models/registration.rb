require 'validates_email_format_of'
class Registration < ApplicationRecord
  belongs_to :event, :foreign_key=>'Event', :primary_key=>'id', optional: true
  validates :Name, presence: true, length: { in: 2..50}
  validates :Email, presence: true
  validates :Event, presence: true
  validates :Contact_no, presence: true, numericality: {only_integer: true },length: {is: 10}
  validates :Email, presence: true
  validates_email_format_of :Email
  validates :College, presence: true

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_Event,
      :with_Name,
      :with_College,
      :with_created_at
    ]
  )

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^Name/
      order("LOWER(registrations.Name) #{ direction }")
    when /^Event/
      order("LOWER(registrations.Event) #{ direction }")
    when /^College/
      order("LOWER(registrations.College) #{ direction }")
    when /^created_at/
      order("LOWER(registrations.created_at) #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  def self.options_for_sorted_by
    [
      ['Name (a-z)', 'name_asc'],
      ['Event (a-z)', 'event_asc'],
      ['College (a-z)', 'college_asc'],
      ['Registered on (newest first)', 'created_at_desc']
    ]
  end
  def self.options_for_select
    order('Name')
  end
  def self.options_for_select
    order('Event')
  end
  def self.options_for_select
    order('College')
  end
  def self.options_for_select
    order('created_at')
  end

end
