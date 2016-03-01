# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  title      :string
#  caption    :string
#  url        :string
#  short_url  :string
#  league_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Video, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
