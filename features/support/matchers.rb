RSpec::Matchers.define :be_ordered_descending do
  match do |actual|
  	actual == actual.sort.reverse
  end

  failure_message_for_should do |actual|
    "expected that #{actual} would be ordered descending"
  end


end