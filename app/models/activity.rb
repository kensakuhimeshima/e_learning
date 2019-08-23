class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :action, polymorphic: true, dependent: :destroy

  has_one :activity, as: :action, dependent: :destroy
end
