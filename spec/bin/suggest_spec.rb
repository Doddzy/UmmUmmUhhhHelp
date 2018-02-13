require 'spec_helper'

describe 'suggest script', type: :aruba do
  it 'tries to suggest a thing' do
    run './bin/suggest'
    stop_all_commands
    expect(last_command_started.output.chomp.length).to be > 5
  end
end
