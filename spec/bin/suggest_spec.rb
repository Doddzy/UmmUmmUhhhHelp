require 'spec_helper'

describe 'suggest script', type: :aruba do
  it 'tries to suggest a thing' do
    run './bin/suggest'
    type 'default\n'
    stop_all_commands

    expect(last_command_started.output.split.last).to eq('Mastercard')
  end
end
