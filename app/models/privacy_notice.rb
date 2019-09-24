class PrivacyNotice < ApplicationRecord
  serialize :collected_data, Array
  serialize :reused_data, Array
end
