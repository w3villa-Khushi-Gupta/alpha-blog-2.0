RSpec::Matchers.define :have_before_action do |expected_action|
    match do |controller|
      controller._process_action_callbacks.any? do |callback|
        callback.kind == :before && callback.filter == expected_action
      end
    end
  end
  